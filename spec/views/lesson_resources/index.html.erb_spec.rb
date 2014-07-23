require 'spec_helper'

describe "lesson_resources/index" do
  before(:each) do
    assign(:lesson_resources, [
      stub_model(LessonResource,
        :select_id => 1,
        :book => "MyText",
        :notes => "MyText"
      ),
      stub_model(LessonResource,
        :select_id => 1,
        :book => "MyText",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of lesson_resources" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
