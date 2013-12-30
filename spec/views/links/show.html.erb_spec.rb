require 'spec_helper'

describe "links/show" do
  before(:each) do
    @link = assign(:link, stub_model(Link))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
