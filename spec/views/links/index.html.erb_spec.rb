require 'spec_helper'

describe "links/index" do
  before(:each) do
    assign(:links, [
      stub_model(Link),
      stub_model(Link)
    ])
  end

  it "renders a list of links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
