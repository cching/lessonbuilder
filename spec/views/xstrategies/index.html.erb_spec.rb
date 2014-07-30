require 'spec_helper'

describe "xstrategies/index" do
  before(:each) do
    assign(:xstrategies, [
      stub_model(Xstrategy),
      stub_model(Xstrategy)
    ])
  end

  it "renders a list of xstrategies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
