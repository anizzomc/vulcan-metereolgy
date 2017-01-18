class ClimaController < ApplicationController

  def index
    if is_rest
      handle_as_rest
    else
      @forecasts = ForecastPresenter.present_all(Climatology::WeatherForecast.order(:day))
      @statictics = Climatology::WeatherStatictics.new(@forecasts)
    end
  end

  def show
    day = params[:day].to_i
    system = Climatology::StarSystemFactory.build_system
    forecast = Climatology::WeatherForecast.find_by(day: day)
    unless forecast
      forecaster = Climatology::Forecaster.new(system).forecast(day)
      forecast = Climatology::WeatherForecast.new(
          day: day,
          forecast: forecaster.forecast,
          rain_incidence: forecast.rain_incidence
      )
      # forecast.save # Don't save in order to not alter the stats
    end


    @system = Climatology::TimedSystem.new(Climatology::StarSystemFactory.build_system, params[:day].to_i)
    @forecast = ForecastPresenter.new(forecast)

  end


  private
  def dia(value)
    render json: ForecastPresenter.new(Climatology::WeatherForecast.find_by(day: value))
  end

  def handle_as_rest
    method = is_rest
    self.send(method, rest_param(method))
  end

  def is_rest
    :dia if params.has_key?(:dia)
  end

  def rest_param(method)
    params[method]
  end

end