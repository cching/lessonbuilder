require 'spec_helper'

describe "lesson_resources/new" do
  before(:each) do
    assign(:lesson_resource, stub_model(LessonResource,
      :select_id => 1,
      :book => "MyText",
      :notes => "MyText"
    ).as_new_record)
  end

  it "renders new lesson_resource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lesson_resources_path, :method => "post" do
      assert_select "input#lesson_resource_select_id", :name => "lesson_resource[select_id]"
      assert_select "textarea#lesson_resource_book", :name => "lesson_resource[book]"
      assert_select "textarea#lesson_resource_notes", :name => "lesson_resource[notes]"
    end
  end
end
