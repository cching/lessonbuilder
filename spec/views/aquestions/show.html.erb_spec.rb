require 'spec_helper'

describe "aquestions/show" do
  before(:each) do
    @aquestion = assign(:aquestion, stub_model(Aquestion,
      :content => "MyText",
      :standard_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
