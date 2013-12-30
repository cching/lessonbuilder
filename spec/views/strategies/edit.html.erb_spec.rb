require 'spec_helper'

describe "strategies/edit" do
  before(:each) do
    @strategy = assign(:strategy, stub_model(Strategy))
  end

  it "renders the edit strategy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => strategies_path(@strategy), :method => "post" do
    end
  end
end
