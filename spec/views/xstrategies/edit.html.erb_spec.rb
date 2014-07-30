require 'spec_helper'

describe "xstrategies/edit" do
  before(:each) do
    @xstrategy = assign(:xstrategy, stub_model(Xstrategy))
  end

  it "renders the edit xstrategy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => xstrategies_path(@xstrategy), :method => "post" do
    end
  end
end
