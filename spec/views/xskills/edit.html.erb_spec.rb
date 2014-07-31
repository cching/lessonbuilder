require 'spec_helper'

describe "xskills/edit" do
  before(:each) do
    @xskill = assign(:xskill, stub_model(Xskill))
  end

  it "renders the edit xskill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => xskills_path(@xskill), :method => "post" do
    end
  end
end
