require 'spec_helper'

describe "select_links/show" do
  before(:each) do
    @select_link = assign(:select_link, stub_model(SelectLink,
      :select_id => 1,
      :link_id => 2,
      :comment => "MyText",
      :link => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
