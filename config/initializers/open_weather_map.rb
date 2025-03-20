Rails.application.config.after_initialize do
  OpenWeatherClient = OpenWeather::Client.new(api_key: ENV["OPENWEATHERMAP_API_KEY"])
end
