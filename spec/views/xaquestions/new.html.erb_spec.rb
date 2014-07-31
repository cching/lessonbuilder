require 'spec_helper'

describe "xaquestions/new" do
  before(:each) do
    assign(:xaquestion, stub_model(Xaquestion).as_new_record)
  end

  it "renders new xaquestion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => xaquestions_path, :method => "post" do
    end
  end
end
