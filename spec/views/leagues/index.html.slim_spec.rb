require 'rails_helper'

RSpec.describe "leagues/index", type: :view do
  before(:each) do
    assign(:leagues, [
      League.create!(
        :name => "Name",
        :edition => "Edition",
        :start_date => "Start Date",
        :end_date => "End Date",
        :director_id => "Director"
      ),
      League.create!(
        :name => "Name",
        :edition => "Edition",
        :start_date => "Start Date",
        :end_date => "End Date",
        :director_id => "Director"
      )
    ])
  end

  it "renders a list of leagues" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Edition".to_s, :count => 2
    assert_select "tr>td", :text => "Start Date".to_s, :count => 2
    assert_select "tr>td", :text => "End Date".to_s, :count => 2
    assert_select "tr>td", :text => "Director".to_s, :count => 2
  end
end
