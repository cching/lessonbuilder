require 'spec_helper'

describe "strategies/new" do
  before(:each) do
    assign(:strategy, stub_model(Strategy).as_new_record)
  end

  it "renders new strategy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => strategies_path, :method => "post" do
    end
  end
end
