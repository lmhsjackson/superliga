require 'rails_helper'

RSpec.describe "leagues/new", type: :view do
  before(:each) do
    assign(:league, League.new(
      :name => "MyString",
      :edition => "MyString",
      :start_date => "MyString",
      :end_date => "MyString",
      :director_id => "MyString"
    ))
  end

  it "renders new league form" do
    render

    assert_select "form[action=?][method=?]", leagues_path, "post" do

      assert_select "input[name=?]", "league[name]"

      assert_select "input[name=?]", "league[edition]"

      assert_select "input[name=?]", "league[start_date]"

      assert_select "input[name=?]", "league[end_date]"

      assert_select "input[name=?]", "league[director_id]"
    end
  end
end
