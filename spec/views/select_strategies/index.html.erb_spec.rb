require 'spec_helper'

describe "select_strategies/index" do
  before(:each) do
    assign(:select_strategies, [
      stub_model(SelectStrategy,
        :select_id => 1,
        :strategy_id => 2,
        :content => "Content"
      ),
      stub_model(SelectStrategy,
        :select_id => 1,
        :strategy_id => 2,
        :content => "Content"
      )
    ])
  end

  it "renders a list of select_strategies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
