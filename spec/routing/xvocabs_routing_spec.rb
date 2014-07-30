require "spec_helper"

describe XvocabsController do
  describe "routing" do

    it "routes to #index" do
      get("/xvocabs").should route_to("xvocabs#index")
    end

    it "routes to #new" do
      get("/xvocabs/new").should route_to("xvocabs#new")
    end

    it "routes to #show" do
      get("/xvocabs/1").should route_to("xvocabs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/xvocabs/1/edit").should route_to("xvocabs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/xvocabs").should route_to("xvocabs#create")
    end

    it "routes to #update" do
      put("/xvocabs/1").should route_to("xvocabs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/xvocabs/1").should route_to("xvocabs#destroy", :id => "1")
    end

  end
end
