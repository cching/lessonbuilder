require 'spec_helper'

describe "xquestions/edit" do
  before(:each) do
    @xquestion = assign(:xquestion, stub_model(Xquestion))
  end

  it "renders the edit xquestion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => xquestions_path(@xquestion), :method => "post" do
    end
  end
end
