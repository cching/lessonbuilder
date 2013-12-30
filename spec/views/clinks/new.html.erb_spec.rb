require 'spec_helper'

describe "clinks/new" do
  before(:each) do
    assign(:clink, stub_model(Clink,
      :select_id => 1,
      :standard_id => "MyString",
      :comment => "MyString",
      :link => "MyString"
    ).as_new_record)
  end

  it "renders new clink form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clinks_path, :method => "post" do
      assert_select "input#clink_select_id", :name => "clink[select_id]"
      assert_select "input#clink_standard_id", :name => "clink[standard_id]"
      assert_select "input#clink_comment", :name => "clink[comment]"
      assert_select "input#clink_link", :name => "clink[link]"
    end
  end
end
