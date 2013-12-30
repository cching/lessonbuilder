require "spec_helper"

describe VocabsController do
  describe "routing" do

    it "routes to #index" do
      get("/vocabs").should route_to("vocabs#index")
    end

    it "routes to #new" do
      get("/vocabs/new").should route_to("vocabs#new")
    end

    it "routes to #show" do
      get("/vocabs/1").should route_to("vocabs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vocabs/1/edit").should route_to("vocabs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vocabs").should route_to("vocabs#create")
    end

    it "routes to #update" do
      put("/vocabs/1").should route_to("vocabs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vocabs/1").should route_to("vocabs#destroy", :id => "1")
    end

  end
end
