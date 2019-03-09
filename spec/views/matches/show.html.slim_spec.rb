require 'rails_helper'

RSpec.describe "matches/show", type: :view do
  before(:each) do
    @match = assign(:match, Match.create!(
      :kifu => "Kifu",
      :handicap => "Handicap",
      :winner => "Winner",
      :victory_condition => "Victory Condition",
      :location_id => "Location",
      :league_id => "League",
      :created_at => "Created At",
      :updated_at => "Updated At",
      :black_player_id => "Black Player",
      :white_player_id => "White Player"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Kifu/)
    expect(rendered).to match(/Handicap/)
    expect(rendered).to match(/Winner/)
    expect(rendered).to match(/Victory Condition/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/League/)
    expect(rendered).to match(/Created At/)
    expect(rendered).to match(/Updated At/)
    expect(rendered).to match(/Black Player/)
    expect(rendered).to match(/White Player/)
  end
end
