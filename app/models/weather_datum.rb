class WeatherDatum < ApplicationRecord
  validates :zipcode, presence: true, uniqueness: true
  validates :data, presence: true

  def self.get_by_zipcode(zipcode)
    expire(zipcode)
    cached_data = find_by(zipcode: zipcode)
  end

  private_class_method def self.expire(zipcode) # Delete outdated cache records
    where(zipcode: zipcode, created_at: ..(30.minutes.ago)).delete_all
  end
end
