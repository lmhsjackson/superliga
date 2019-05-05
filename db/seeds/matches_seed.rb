league = League.first
# location = Location.first

participants_ids = league.participants.pluck :id
rivals_ids = participants_ids.product(participants_ids.reverse)
  .select {|id_pair| id_pair[0] != id_pair[1] }

rivals_ids.each do |black_id, white_id|
  match_participations = MatchParticipation.create([
    {
      color:'black',
      participant_id: black_id,
      winner: true
    },
    {
      color:'white',
      participant_id: white_id,
      winner: false
    }
  ])

  Match.create(
    league: league,
    match_participations: match_participations,
    location: Location.first,
    victory_condition: 'resignation'
  )
end
