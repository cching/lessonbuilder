require 'spec_helper'

describe "assessments/new" do
  before(:each) do
    assign(:assessment, stub_model(Assessment,
      :select_id => "",
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new assessment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assessments_path, :method => "post" do
      assert_select "input#assessment_select_id", :name => "assessment[select_id]"
      assert_select "input#assessment_title", :name => "assessment[title]"
    end
  end
end
