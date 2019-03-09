require 'rails_helper'

RSpec.describe "leagues/edit", type: :view do
  before(:each) do
    @league = assign(:league, League.create!(
      :name => "MyString",
      :edition => "MyString",
      :start_date => "MyString",
      :end_date => "MyString",
      :director_id => "MyString"
    ))
  end

  it "renders the edit league form" do
    render

    assert_select "form[action=?][method=?]", league_path(@league), "post" do

      assert_select "input[name=?]", "league[name]"

      assert_select "input[name=?]", "league[edition]"

      assert_select "input[name=?]", "league[start_date]"

      assert_select "input[name=?]", "league[end_date]"

      assert_select "input[name=?]", "league[director_id]"
    end
  end
end
