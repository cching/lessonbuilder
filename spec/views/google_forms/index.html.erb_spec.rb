require 'spec_helper'

describe "google_forms/index" do
  before(:each) do
    assign(:google_forms, [
      stub_model(GoogleForm),
      stub_model(GoogleForm)
    ])
  end

  it "renders a list of google_forms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
