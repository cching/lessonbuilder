require 'spec_helper'

describe "Cstrategies" do
  describe "GET /cstrategies" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get cstrategies_path
      response.status.should be(200)
    end
  end
end
