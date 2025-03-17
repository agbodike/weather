require 'rails_helper'

RSpec.describe "Weathers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/weather/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /forecast" do
    it "returns http success" do
      get "/weather/forecast"
      expect(response).to have_http_status(:success)
    end
  end

end
