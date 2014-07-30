require 'spec_helper'

describe "xlinks/show" do
  before(:each) do
    @xlink = assign(:xlink, stub_model(Xlink))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
