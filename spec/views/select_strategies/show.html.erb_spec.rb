require 'spec_helper'

describe "select_strategies/show" do
  before(:each) do
    @select_strategy = assign(:select_strategy, stub_model(SelectStrategy,
      :select_id => 1,
      :strategy_id => 2,
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Content/)
  end
end
