require 'spec_helper'

describe "lessonplans/show" do
  before(:each) do
    @lessonplan = assign(:lessonplan, stub_model(Lessonplan,
      :user_id => 1,
      :district_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
