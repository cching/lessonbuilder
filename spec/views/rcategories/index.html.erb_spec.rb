require 'spec_helper'

describe "rcategories/index" do
  before(:each) do
    assign(:rcategories, [
      stub_model(Rcategory),
      stub_model(Rcategory)
    ])
  end

  it "renders a list of rcategories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
