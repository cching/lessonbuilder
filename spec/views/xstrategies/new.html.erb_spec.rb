require 'spec_helper'

describe "xstrategies/new" do
  before(:each) do
    assign(:xstrategy, stub_model(Xstrategy).as_new_record)
  end

  it "renders new xstrategy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => xstrategies_path, :method => "post" do
    end
  end
end
