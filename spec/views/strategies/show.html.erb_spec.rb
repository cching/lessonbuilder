require 'spec_helper'

describe "strategies/show" do
  before(:each) do
    @strategy = assign(:strategy, stub_model(Strategy))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
