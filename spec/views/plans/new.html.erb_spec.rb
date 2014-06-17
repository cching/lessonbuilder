require 'spec_helper'

describe "plans/new" do
  before(:each) do
    assign(:plan, stub_model(Plan,
      :name => "MyString",
      :district_id => 1,
      :select_id => 1,
      :initiate => false
    ).as_new_record)
  end

  it "renders new plan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => plans_path, :method => "post" do
      assert_select "input#plan_name", :name => "plan[name]"
      assert_select "input#plan_district_id", :name => "plan[district_id]"
      assert_select "input#plan_select_id", :name => "plan[select_id]"
      assert_select "input#plan_initiate", :name => "plan[initiate]"
    end
  end
end
