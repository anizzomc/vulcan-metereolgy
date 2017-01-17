namespace :climatology do
  desc "Generate the Forecast for the next 10 years"
  task generate: :environment do
    forecaster = Climatology::Forecaster.new(Climatology::StarSystemFactory.build_system)
    days_in_total = 10*365
    for t in (0..days_in_total)
      forecast = forecaster.forecast(t)
      puts "[*] Forecast: Day #{t}, Forecast: #{forecast.forecast}, Rain: #{forecast.rain_incidence}"
      record = Climatology::WeatherForecast.new(
          day: t,
          forecast: forecast.forecast,
          rain_incidence: forecast.rain_incidence
      )

      record.save
    end



  end

  desc "Clear the existing forecast"
  task clear: :environment do
    Climatology::WeatherForecast.delete_all
  end

end
