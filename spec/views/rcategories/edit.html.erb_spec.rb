require 'spec_helper'

describe "rcategories/edit" do
  before(:each) do
    @rcategory = assign(:rcategory, stub_model(Rcategory))
  end

  it "renders the edit rcategory form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rcategories_path(@rcategory), :method => "post" do
    end
  end
end
