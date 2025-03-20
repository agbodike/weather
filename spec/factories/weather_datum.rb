FactoryBot.define do
  factory :weather_datum do
    data do
      { "temp"=>62.44,
        "feels_like"=>59.56,
        "temp_min"=>55.29,
        "temp_max"=>64.58,
        "pressure"=>1017,
        "humidity"=>25,
        "sea_level"=>1017,
        "grnd_level"=>1011 }.to_json
    end
    zipcode { "12345" }
  end
end

