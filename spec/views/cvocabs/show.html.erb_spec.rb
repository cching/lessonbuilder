require 'spec_helper'

describe "cvocabs/show" do
  before(:each) do
    @cvocab = assign(:cvocab, stub_model(Cvocab,
      :select_id => 1,
      :standard_id => 2,
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Content/)
  end
end
