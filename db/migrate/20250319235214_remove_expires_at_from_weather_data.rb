class RemoveExpiresAtFromWeatherData < ActiveRecord::Migration[7.2]
  def change
    remove_column :weather_data, :expires_at, :datetime
  end
end
