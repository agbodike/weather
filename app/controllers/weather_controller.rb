class WeatherController < ApplicationController
  def index
  end

  def forecast
    @address = params[:address]
    @weather_data = {
      "current_temp" => 78,
      "temp_min"     => 56,
      "temp_max"     => 85,
      "feels_like"   => 79,
      "humidity"     => 73
    }
  end
end
