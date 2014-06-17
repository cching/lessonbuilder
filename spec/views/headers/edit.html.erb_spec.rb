require 'spec_helper'

describe "headers/edit" do
  before(:each) do
    @header = assign(:header, stub_model(Header))
  end

  it "renders the edit header form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => headers_path(@header), :method => "post" do
    end
  end
end
