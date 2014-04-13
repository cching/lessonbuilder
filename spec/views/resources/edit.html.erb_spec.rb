require 'spec_helper'

describe "resources/edit" do
  before(:each) do
    @resource = assign(:resource, stub_model(Resource,
      :content => "MyText",
      :media => "MyText",
      :title => "MyText"
    ))
  end

  it "renders the edit resource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => resources_path(@resource), :method => "post" do
      assert_select "textarea#resource_content", :name => "resource[content]"
      assert_select "textarea#resource_media", :name => "resource[media]"
      assert_select "textarea#resource_title", :name => "resource[title]"
    end
  end
end
