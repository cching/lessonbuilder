require 'spec_helper'

describe "xquestions/index" do
  before(:each) do
    assign(:xquestions, [
      stub_model(Xquestion),
      stub_model(Xquestion)
    ])
  end

  it "renders a list of xquestions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
