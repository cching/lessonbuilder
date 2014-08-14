require 'spec_helper'

describe "assessments/edit" do
  before(:each) do
    @assessment = assign(:assessment, stub_model(Assessment,
      :select_id => "",
      :title => "MyString"
    ))
  end

  it "renders the edit assessment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assessments_path(@assessment), :method => "post" do
      assert_select "input#assessment_select_id", :name => "assessment[select_id]"
      assert_select "input#assessment_title", :name => "assessment[title]"
    end
  end
end
