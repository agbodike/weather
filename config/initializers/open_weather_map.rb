Rails.application.config.after_initialize do
  OpenWeatherClient = OpenWeather::Client.new(api_key: Rails.configuration.openweathermap_api_key)
end
