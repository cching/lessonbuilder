require 'spec_helper'

describe "headers/show" do
  before(:each) do
    @header = assign(:header, stub_model(Header))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
