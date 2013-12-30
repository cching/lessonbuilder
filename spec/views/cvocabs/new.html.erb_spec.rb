require 'spec_helper'

describe "cvocabs/new" do
  before(:each) do
    assign(:cvocab, stub_model(Cvocab,
      :select_id => 1,
      :standard_id => 1,
      :content => "MyString"
    ).as_new_record)
  end

  it "renders new cvocab form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cvocabs_path, :method => "post" do
      assert_select "input#cvocab_select_id", :name => "cvocab[select_id]"
      assert_select "input#cvocab_standard_id", :name => "cvocab[standard_id]"
      assert_select "input#cvocab_content", :name => "cvocab[content]"
    end
  end
end
