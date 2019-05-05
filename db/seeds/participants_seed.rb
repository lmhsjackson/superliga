league = League.first
Player.all.each do |player|
 p =  Participant.create(player: player, rank: player.rank, league: league)
end
