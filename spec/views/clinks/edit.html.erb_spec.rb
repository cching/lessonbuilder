require 'spec_helper'

describe "clinks/edit" do
  before(:each) do
    @clink = assign(:clink, stub_model(Clink,
      :select_id => 1,
      :standard_id => "MyString",
      :comment => "MyString",
      :link => "MyString"
    ))
  end

  it "renders the edit clink form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clinks_path(@clink), :method => "post" do
      assert_select "input#clink_select_id", :name => "clink[select_id]"
      assert_select "input#clink_standard_id", :name => "clink[standard_id]"
      assert_select "input#clink_comment", :name => "clink[comment]"
      assert_select "input#clink_link", :name => "clink[link]"
    end
  end
end
