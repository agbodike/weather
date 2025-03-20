require 'rails_helper'

RSpec.describe "weather/forecast.html.erb", type: :view do
  let(:weather_data) do
    { "temp"=>62.44,
      "feels_like"=>59.56,
      "temp_min"=>55.29,
      "temp_max"=>64.58,
      "pressure"=>1017,
      "humidity"=>25,
      "sea_level"=>1017,
      "grnd_level"=>1011 }
  end

    before do
      assign(:address, "123 Main St, 06511")
      assign(:weather_data, weather_data)
    end

  context "with fresh data from the API" do
    before do
      assign(:from_cache, false)
    end

    it "show 'Fresh Data'" do
      render
      expect(rendered).to match(/Fresh Data/)
    end

    it "does not show 'Fresh Data'" do
      render
      expect(rendered).not_to match(/Data retrieved from cache/)
    end
  end

  context "with cached data" do
    before do
      assign(:from_cache, true)
    end

    it "show 'Fresh Data'" do
      render
      expect(rendered).to match(/Data retrieved from cache/)
    end

    it "does not show 'Fresh Data'" do
      render
      expect(rendered).not_to match(/Fresh Data/)
    end
  end
end
