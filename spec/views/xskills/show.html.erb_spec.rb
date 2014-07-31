require 'spec_helper'

describe "xskills/show" do
  before(:each) do
    @xskill = assign(:xskill, stub_model(Xskill))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
