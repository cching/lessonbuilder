require 'spec_helper'

describe "GoogleForms" do
  describe "GET /google_forms" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get google_forms_path
      response.status.should be(200)
    end
  end
end
