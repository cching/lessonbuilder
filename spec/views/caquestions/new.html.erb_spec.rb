require 'spec_helper'

describe "caquestions/new" do
  before(:each) do
    assign(:caquestion, stub_model(Caquestion,
      :standard_id => 1,
      :select_id => 1,
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new caquestion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => caquestions_path, :method => "post" do
      assert_select "input#caquestion_standard_id", :name => "caquestion[standard_id]"
      assert_select "input#caquestion_select_id", :name => "caquestion[select_id]"
      assert_select "textarea#caquestion_content", :name => "caquestion[content]"
    end
  end
end
