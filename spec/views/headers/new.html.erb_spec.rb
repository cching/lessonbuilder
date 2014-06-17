require 'spec_helper'

describe "headers/new" do
  before(:each) do
    assign(:header, stub_model(Header).as_new_record)
  end

  it "renders new header form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => headers_path, :method => "post" do
    end
  end
end
