require 'spec_helper'

describe "lessonplans/edit" do
  before(:each) do
    @lessonplan = assign(:lessonplan, stub_model(Lessonplan,
      :user_id => 1,
      :district_id => 1
    ))
  end

  it "renders the edit lessonplan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lessonplans_path(@lessonplan), :method => "post" do
      assert_select "input#lessonplan_user_id", :name => "lessonplan[user_id]"
      assert_select "input#lessonplan_district_id", :name => "lessonplan[district_id]"
    end
  end
end
