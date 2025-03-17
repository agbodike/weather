class WeatherController < ApplicationController
  def index
  end

  def forecast
    @address = params[:address]
    zipcode = extract_zipcode
    cached_data = WeatherDatum.where(zipcode: zipcode).first
    @weather_data = JSON.parse cached_data.data
  end

  private

  def extract_zipcode
    zipcode_match = @address.match(/\b\d{5}\b/)
    zipcode_match[0] if zipcode_match
  end
end
