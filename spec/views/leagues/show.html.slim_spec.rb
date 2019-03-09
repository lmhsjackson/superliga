require 'rails_helper'

RSpec.describe "leagues/show", type: :view do
  before(:each) do
    @league = assign(:league, League.create!(
      :name => "Name",
      :edition => "Edition",
      :start_date => "Start Date",
      :end_date => "End Date",
      :director_id => "Director"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Edition/)
    expect(rendered).to match(/Start Date/)
    expect(rendered).to match(/End Date/)
    expect(rendered).to match(/Director/)
  end
end
