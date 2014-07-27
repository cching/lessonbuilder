require 'spec_helper'

describe "xquestions/new" do
  before(:each) do
    assign(:xquestion, stub_model(Xquestion).as_new_record)
  end

  it "renders new xquestion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => xquestions_path, :method => "post" do
    end
  end
end
