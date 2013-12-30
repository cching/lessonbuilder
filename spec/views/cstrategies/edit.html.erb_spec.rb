require 'spec_helper'

describe "cstrategies/edit" do
  before(:each) do
    @cstrategy = assign(:cstrategy, stub_model(Cstrategy,
      :select_id => 1,
      :standard_id => "MyString",
      :content => "MyString"
    ))
  end

  it "renders the edit cstrategy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cstrategies_path(@cstrategy), :method => "post" do
      assert_select "input#cstrategy_select_id", :name => "cstrategy[select_id]"
      assert_select "input#cstrategy_standard_id", :name => "cstrategy[standard_id]"
      assert_select "input#cstrategy_content", :name => "cstrategy[content]"
    end
  end
end
