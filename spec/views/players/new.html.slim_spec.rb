require 'rails_helper'

RSpec.describe "players/new", type: :view do
  before(:each) do
    assign(:player, Player.new(
      :name => "MyString",
      :email => "MyString",
      :rango => "MyString"
    ))
  end

  it "renders new player form" do
    render

    assert_select "form[action=?][method=?]", players_path, "post" do

      assert_select "input[name=?]", "player[name]"

      assert_select "input[name=?]", "player[email]"

      assert_select "input[name=?]", "player[rango]"
    end
  end
end
