require 'spec_helper'

describe "cstrategies/index" do
  before(:each) do
    assign(:cstrategies, [
      stub_model(Cstrategy,
        :select_id => 1,
        :standard_id => "Standard",
        :content => "Content"
      ),
      stub_model(Cstrategy,
        :select_id => 1,
        :standard_id => "Standard",
        :content => "Content"
      )
    ])
  end

  it "renders a list of cstrategies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Standard".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
