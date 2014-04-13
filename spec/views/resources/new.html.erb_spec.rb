require 'spec_helper'

describe "resources/new" do
  before(:each) do
    assign(:resource, stub_model(Resource,
      :content => "MyText",
      :media => "MyText",
      :title => "MyText"
    ).as_new_record)
  end

  it "renders new resource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => resources_path, :method => "post" do
      assert_select "textarea#resource_content", :name => "resource[content]"
      assert_select "textarea#resource_media", :name => "resource[media]"
      assert_select "textarea#resource_title", :name => "resource[title]"
    end
  end
end
