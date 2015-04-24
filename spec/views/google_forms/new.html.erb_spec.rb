require 'spec_helper'

describe "google_forms/new" do
  before(:each) do
    assign(:google_form, stub_model(GoogleForm).as_new_record)
  end

  it "renders new google_form form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => google_forms_path, :method => "post" do
    end
  end
end
