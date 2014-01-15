require 'spec_helper'

describe "select_links/new" do
  before(:each) do
    assign(:select_link, stub_model(SelectLink,
      :select_id => 1,
      :link_id => 1,
      :comment => "MyText",
      :link => "MyText"
    ).as_new_record)
  end

  it "renders new select_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => select_links_path, :method => "post" do
      assert_select "input#select_link_select_id", :name => "select_link[select_id]"
      assert_select "input#select_link_link_id", :name => "select_link[link_id]"
      assert_select "textarea#select_link_comment", :name => "select_link[comment]"
      assert_select "textarea#select_link_link", :name => "select_link[link]"
    end
  end
end
