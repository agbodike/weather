class WeatherDatum < ApplicationRecord
  validates :zipcode, presence: true, uniqueness: true
  validates :data, presence: true
  validates :expires_at, presence: true
end
