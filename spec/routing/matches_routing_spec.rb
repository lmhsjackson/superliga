require "rails_helper"

RSpec.describe MatchesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "leagues/1/matches").to route_to("matches#index", league_id: '1')
    end

    it "routes to #new" do
      expect(:get => "leagues/1/matches/new").to route_to("matches#new", league_id: '1')
    end

    it "routes to #show" do
      expect(:get => "leagues/1/matches/1").to route_to("matches#show", :id => "1", league_id: '1')
    end

    it "routes to #edit" do
      expect(:get => "leagues/1/matches/1/edit").to route_to("matches#edit", :id => "1", league_id: '1')
    end


    it "routes to #create" do
      expect(:post => "leagues/1/matches").to route_to("matches#create", league_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "leagues/1/matches/1").to route_to("matches#update", :id => "1", league_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "leagues/1/matches/1").to route_to("matches#update", :id => "1", league_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "leagues/1/matches/1").to route_to("matches#destroy", :id => "1", league_id: '1')
    end
  end
end
