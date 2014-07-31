require 'spec_helper'

describe "xaquestions/show" do
  before(:each) do
    @xaquestion = assign(:xaquestion, stub_model(Xaquestion))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
