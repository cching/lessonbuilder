require 'spec_helper'

describe "rcategories/show" do
  before(:each) do
    @rcategory = assign(:rcategory, stub_model(Rcategory))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
