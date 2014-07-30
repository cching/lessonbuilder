require 'spec_helper'

describe "xlinks/new" do
  before(:each) do
    assign(:xlink, stub_model(Xlink).as_new_record)
  end

  it "renders new xlink form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => xlinks_path, :method => "post" do
    end
  end
end
