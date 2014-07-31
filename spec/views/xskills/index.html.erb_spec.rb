require 'spec_helper'

describe "xskills/index" do
  before(:each) do
    assign(:xskills, [
      stub_model(Xskill),
      stub_model(Xskill)
    ])
  end

  it "renders a list of xskills" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
