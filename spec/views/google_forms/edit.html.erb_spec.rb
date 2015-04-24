require 'spec_helper'

describe "google_forms/edit" do
  before(:each) do
    @google_form = assign(:google_form, stub_model(GoogleForm))
  end

  it "renders the edit google_form form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => google_forms_path(@google_form), :method => "post" do
    end
  end
end
