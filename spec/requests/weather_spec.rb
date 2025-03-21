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
      VCR.use_cassette("forecast") do
        get "/weather/forecast?address=06511"
      end

      expect(response).to have_http_status(:success)
    end
  end
end
