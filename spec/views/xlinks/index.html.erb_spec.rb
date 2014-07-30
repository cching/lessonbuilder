require 'spec_helper'

describe "xlinks/index" do
  before(:each) do
    assign(:xlinks, [
      stub_model(Xlink),
      stub_model(Xlink)
    ])
  end

  it "renders a list of xlinks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
