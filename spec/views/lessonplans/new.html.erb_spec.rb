require 'spec_helper'

describe "lessonplans/new" do
  before(:each) do
    assign(:lessonplan, stub_model(Lessonplan,
      :user_id => 1,
      :district_id => 1
    ).as_new_record)
  end

  it "renders new lessonplan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lessonplans_path, :method => "post" do
      assert_select "input#lessonplan_user_id", :name => "lessonplan[user_id]"
      assert_select "input#lessonplan_district_id", :name => "lessonplan[district_id]"
    end
  end
end
