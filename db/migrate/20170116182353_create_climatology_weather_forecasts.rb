class CreateClimatologyWeatherForecasts < ActiveRecord::Migration
  def change
    create_table :climatology_weather_forecasts do |t|
      t.integer :day, null:false, index: true
      t.integer :forecast, null: false
      t.float   :rain_incidence
      t.timestamps null: false
    end
  end
end
