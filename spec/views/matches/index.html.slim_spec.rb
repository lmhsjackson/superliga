require 'rails_helper'

RSpec.describe "matches/index", type: :view do
  before(:each) do
    assign(:matches, [
      Match.create!(
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
      ),
      Match.create!(
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
      )
    ])
  end

  it "renders a list of matches" do
    render
    assert_select "tr>td", :text => "Kifu".to_s, :count => 2
    assert_select "tr>td", :text => "Handicap".to_s, :count => 2
    assert_select "tr>td", :text => "Winner".to_s, :count => 2
    assert_select "tr>td", :text => "Victory Condition".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "League".to_s, :count => 2
    assert_select "tr>td", :text => "Created At".to_s, :count => 2
    assert_select "tr>td", :text => "Updated At".to_s, :count => 2
    assert_select "tr>td", :text => "Black Player".to_s, :count => 2
    assert_select "tr>td", :text => "White Player".to_s, :count => 2
  end
end
