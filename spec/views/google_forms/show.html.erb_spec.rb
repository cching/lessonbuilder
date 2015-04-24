require 'spec_helper'

describe "google_forms/show" do
  before(:each) do
    @google_form = assign(:google_form, stub_model(GoogleForm))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
