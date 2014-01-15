require "spec_helper"

describe SelectVocabsController do
  describe "routing" do

    it "routes to #index" do
      get("/select_vocabs").should route_to("select_vocabs#index")
    end

    it "routes to #new" do
      get("/select_vocabs/new").should route_to("select_vocabs#new")
    end

    it "routes to #show" do
      get("/select_vocabs/1").should route_to("select_vocabs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/select_vocabs/1/edit").should route_to("select_vocabs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/select_vocabs").should route_to("select_vocabs#create")
    end

    it "routes to #update" do
      put("/select_vocabs/1").should route_to("select_vocabs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/select_vocabs/1").should route_to("select_vocabs#destroy", :id => "1")
    end

  end
end
