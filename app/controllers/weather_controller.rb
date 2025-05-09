class WeatherController < ApplicationController
  def index
  end

  def forecast
    @address = params[:address]
    zipcode = extract_zipcode
    unless zipcode
      flash[:alert] = "Zipcode is required with the address"
      redirect_to weather_index_path
      return
    end
    @weather_data, @from_cache = get_forecast(zipcode)
  end

  private

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
      WeatherDatum.create(zipcode: zipcode, data: data.to_json)
      [ data, false ] # No valid cached_data found
    end
  end
end
