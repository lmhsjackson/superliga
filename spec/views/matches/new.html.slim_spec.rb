require 'rails_helper'

RSpec.describe "matches/new", type: :view do
  before(:each) do
    assign(:match, Match.new(
      :kifu => "MyString",
      :handicap => "MyString",
      :winner => "MyString",
      :victory_condition => "MyString",
      :location_id => "MyString",
      :league_id => "MyString",
      :created_at => "MyString",
      :updated_at => "MyString",
      :black_player_id => "MyString",
      :white_player_id => "MyString"
    ))
  end

  it "renders new match form" do
    render

    assert_select "form[action=?][method=?]", matches_path, "post" do

      assert_select "input[name=?]", "match[kifu]"

      assert_select "input[name=?]", "match[handicap]"

      assert_select "input[name=?]", "match[winner]"

      assert_select "input[name=?]", "match[victory_condition]"

      assert_select "input[name=?]", "match[location_id]"

      assert_select "input[name=?]", "match[league_id]"

      assert_select "input[name=?]", "match[created_at]"

      assert_select "input[name=?]", "match[updated_at]"

      assert_select "input[name=?]", "match[black_player_id]"

      assert_select "input[name=?]", "match[white_player_id]"
    end
  end
end
