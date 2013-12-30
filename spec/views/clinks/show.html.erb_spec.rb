require 'spec_helper'

describe "clinks/show" do
  before(:each) do
    @clink = assign(:clink, stub_model(Clink,
      :select_id => 1,
      :standard_id => "Standard",
      :comment => "Comment",
      :link => "Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Standard/)
    rendered.should match(/Comment/)
    rendered.should match(/Link/)
  end
end
