require "rails_helper"

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

    context "without a zipcode" do
      it "shows an error message" do
        get "/weather/forecast?address=123+Main+St%2C+Los+Angeles"
        expect(flash[:alert]).to eq("Zipcode is required with the address")
      end

      it "redirects to the index page" do
        get "/weather/forecast?address=123+Main+St%2C+Los+Angeles"
        expect(response).to redirect_to(weather_index_path)
      end
    end
  end
end
