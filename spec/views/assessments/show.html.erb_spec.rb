require 'spec_helper'

describe "assessments/show" do
  before(:each) do
    @assessment = assign(:assessment, stub_model(Assessment,
      :select_id => "",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Title/)
  end
end
