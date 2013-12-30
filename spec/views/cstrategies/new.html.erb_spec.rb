require 'spec_helper'

describe "cstrategies/new" do
  before(:each) do
    assign(:cstrategy, stub_model(Cstrategy,
      :select_id => 1,
      :standard_id => "MyString",
      :content => "MyString"
    ).as_new_record)
  end

  it "renders new cstrategy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cstrategies_path, :method => "post" do
      assert_select "input#cstrategy_select_id", :name => "cstrategy[select_id]"
      assert_select "input#cstrategy_standard_id", :name => "cstrategy[standard_id]"
      assert_select "input#cstrategy_content", :name => "cstrategy[content]"
    end
  end
end
