require 'spec_helper'

describe "selects/show" do
  before(:each) do
    @select = assign(:select, stub_model(Select,
      :user_id => 1,
      :standard_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
