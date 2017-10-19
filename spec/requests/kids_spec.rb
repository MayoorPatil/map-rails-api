require 'rails_helper'

RSpec.describe "Kids", type: :request do
  describe "GET /kids" do
    it "works! (now write some real specs)" do
      get kids_path
      expect(response).to have_http_status(200)
    end
  end
end
