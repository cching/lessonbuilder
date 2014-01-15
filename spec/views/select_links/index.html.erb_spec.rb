require 'spec_helper'

describe "select_links/index" do
  before(:each) do
    assign(:select_links, [
      stub_model(SelectLink,
        :select_id => 1,
        :link_id => 2,
        :comment => "MyText",
        :link => "MyText"
      ),
      stub_model(SelectLink,
        :select_id => 1,
        :link_id => 2,
        :comment => "MyText",
        :link => "MyText"
      )
    ])
  end

  it "renders a list of select_links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
