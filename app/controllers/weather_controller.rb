class WeatherController < ApplicationController
  def index
  end

  def forecast
    @address = params[:address]
    zipcode = extract_zipcode
    @weather_data = get_forecast(zipcode).first

    lat_lon = get_lat_lon
  end

  private

  def get_lat_lon # Use Geocoder to get coordinates and zipcode from address
    result = Geocoder.search(@address)

    if result.empty?
      flash[:alert] = "Could not find location for that address"
      redirect_to weather_index_path
      return
    end

    location_data = result.first.data

    { lat: location_data["lat"], lon: location_data["lon"] }
  end

  def extract_zipcode
    zipcode_match = @address.match(/\b\d{5}\b/)
    zipcode_match[0] if zipcode_match
  end

  def get_forecast(zipcode)
    cached_data = WeatherDatum.get_by_zipcode(zipcode)
    if cached_data
      [ JSON.parse(cached_data.data), true ] # Return data and cached_data indicator
    else
      data = OpenWeatherClient.current_weather(city: zipcode, units: "imperial").main.to_hash
      [ data, false ] # No valid cached_data found
    end
  end
end
