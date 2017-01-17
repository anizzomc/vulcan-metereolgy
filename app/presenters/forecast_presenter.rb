class ForecastPresenter < SimplePresenter

  def as_json(*)
    ret = {
        dia: day,
        clima: readable_forecast
    }

    ret = ret.merge(incidence: rain_incidence) if rain?
    ret
  end

  def rain?
    forecast.to_sym == :rain
  end

  private
  def readable_forecast
    case forecast.to_sym
      when :rain
        "lluvia"
      when :dry
        "sequía"
      when :optimum
        "optimo"
      else
        "desconocido"
    end
  end


end