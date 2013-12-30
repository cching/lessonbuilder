require 'spec_helper'

describe "clinks/index" do
  before(:each) do
    assign(:clinks, [
      stub_model(Clink,
        :select_id => 1,
        :standard_id => "Standard",
        :comment => "Comment",
        :link => "Link"
      ),
      stub_model(Clink,
        :select_id => 1,
        :standard_id => "Standard",
        :comment => "Comment",
        :link => "Link"
      )
    ])
  end

  it "renders a list of clinks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Standard".to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
