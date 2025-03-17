class CreateWeatherData < ActiveRecord::Migration[7.2]
  def change
    create_table :weather_data do |t|
      t.string :zipcode
      t.text :data
      t.datetime :expires_at

      t.timestamps
    end
  end
end
