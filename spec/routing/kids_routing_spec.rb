require "rails_helper"

RSpec.describe KidsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/kids").to route_to("kids#index")
    end


    it "routes to #show" do
      expect(:get => "/kids/1").to route_to("kids#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/kids").to route_to("kids#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/kids/1").to route_to("kids#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/kids/1").to route_to("kids#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/kids/1").to route_to("kids#destroy", :id => "1")
    end

  end
end
