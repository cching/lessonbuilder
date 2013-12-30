require 'spec_helper'

describe "selects/index" do
  before(:each) do
    assign(:selects, [
      stub_model(Select,
        :user_id => 1,
        :standard_id => 2
      ),
      stub_model(Select,
        :user_id => 1,
        :standard_id => 2
      )
    ])
  end

  it "renders a list of selects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
