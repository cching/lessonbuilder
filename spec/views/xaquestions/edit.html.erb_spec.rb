require 'spec_helper'

describe "xaquestions/edit" do
  before(:each) do
    @xaquestion = assign(:xaquestion, stub_model(Xaquestion))
  end

  it "renders the edit xaquestion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => xaquestions_path(@xaquestion), :method => "post" do
    end
  end
end
