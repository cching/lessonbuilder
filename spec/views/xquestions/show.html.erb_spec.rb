require 'spec_helper'

describe "xquestions/show" do
  before(:each) do
    @xquestion = assign(:xquestion, stub_model(Xquestion))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
