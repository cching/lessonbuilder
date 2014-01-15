require 'spec_helper'

describe "select_strategies/edit" do
  before(:each) do
    @select_strategy = assign(:select_strategy, stub_model(SelectStrategy,
      :select_id => 1,
      :strategy_id => 1,
      :content => "MyString"
    ))
  end

  it "renders the edit select_strategy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => select_strategies_path(@select_strategy), :method => "post" do
      assert_select "input#select_strategy_select_id", :name => "select_strategy[select_id]"
      assert_select "input#select_strategy_strategy_id", :name => "select_strategy[strategy_id]"
      assert_select "input#select_strategy_content", :name => "select_strategy[content]"
    end
  end
end
