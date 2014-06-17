require 'spec_helper'

describe "plans/edit" do
  before(:each) do
    @plan = assign(:plan, stub_model(Plan,
      :name => "MyString",
      :district_id => 1,
      :select_id => 1,
      :initiate => false
    ))
  end

  it "renders the edit plan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => plans_path(@plan), :method => "post" do
      assert_select "input#plan_name", :name => "plan[name]"
      assert_select "input#plan_district_id", :name => "plan[district_id]"
      assert_select "input#plan_select_id", :name => "plan[select_id]"
      assert_select "input#plan_initiate", :name => "plan[initiate]"
    end
  end
end
