require 'spec_helper'

describe "strategies/index" do
  before(:each) do
    assign(:strategies, [
      stub_model(Strategy),
      stub_model(Strategy)
    ])
  end

  it "renders a list of strategies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
