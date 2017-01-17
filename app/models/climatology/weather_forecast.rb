class Climatology::WeatherForecast < ActiveRecord::Base
  enum forecast: [ :dry, :rain, :optimum, :unknown]
end
