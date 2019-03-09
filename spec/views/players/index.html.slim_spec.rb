require 'rails_helper'

RSpec.describe "players/index", type: :view do
  before(:each) do
    assign(:players, [
      Player.create!(
        :name => "Name",
        :email => "Email",
        :rango => "Rango"
      ),
      Player.create!(
        :name => "Name",
        :email => "Email",
        :rango => "Rango"
      )
    ])
  end

  it "renders a list of players" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Rango".to_s, :count => 2
  end
end
