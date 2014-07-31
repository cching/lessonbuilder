require 'spec_helper'

describe "xskills/new" do
  before(:each) do
    assign(:xskill, stub_model(Xskill).as_new_record)
  end

  it "renders new xskill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => xskills_path, :method => "post" do
    end
  end
end
