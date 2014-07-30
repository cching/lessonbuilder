require 'spec_helper'

describe "xstrategies/show" do
  before(:each) do
    @xstrategy = assign(:xstrategy, stub_model(Xstrategy))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
