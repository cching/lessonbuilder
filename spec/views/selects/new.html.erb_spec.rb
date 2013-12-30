require 'spec_helper'

describe "selects/new" do
  before(:each) do
    assign(:select, stub_model(Select,
      :user_id => 1,
      :standard_id => 1
    ).as_new_record)
  end

  it "renders new select form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => selects_path, :method => "post" do
      assert_select "input#select_user_id", :name => "select[user_id]"
      assert_select "input#select_standard_id", :name => "select[standard_id]"
    end
  end
end
