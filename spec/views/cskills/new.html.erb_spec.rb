require 'spec_helper'

describe "cskills/new" do
  before(:each) do
    assign(:cskill, stub_model(Cskill,
      :select_id => 1,
      :standard_id => 1,
      :content => "MyString"
    ).as_new_record)
  end

  it "renders new cskill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cskills_path, :method => "post" do
      assert_select "input#cskill_select_id", :name => "cskill[select_id]"
      assert_select "input#cskill_standard_id", :name => "cskill[standard_id]"
      assert_select "input#cskill_content", :name => "cskill[content]"
    end
  end
end
