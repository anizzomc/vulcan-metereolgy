class ClimaController < ApplicationController

  def index
    if is_rest
      handle_as_rest
    else

    end
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