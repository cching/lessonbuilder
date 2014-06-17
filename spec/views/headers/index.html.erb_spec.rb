require 'spec_helper'

describe "headers/index" do
  before(:each) do
    assign(:headers, [
      stub_model(Header),
      stub_model(Header)
    ])
  end

  it "renders a list of headers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
