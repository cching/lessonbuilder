require 'spec_helper'

describe "xaquestions/index" do
  before(:each) do
    assign(:xaquestions, [
      stub_model(Xaquestion),
      stub_model(Xaquestion)
    ])
  end

  it "renders a list of xaquestions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
