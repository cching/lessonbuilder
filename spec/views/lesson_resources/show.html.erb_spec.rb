require 'spec_helper'

describe "lesson_resources/show" do
  before(:each) do
    @lesson_resource = assign(:lesson_resource, stub_model(LessonResource,
      :select_id => 1,
      :book => "MyText",
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
