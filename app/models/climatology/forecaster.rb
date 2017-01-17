module Climatology
  class Forecaster
    attr_reader :system

    DRY = :dry
    RAIN = :rain
    OPTIMUM = :optimum
    UNKNOWN = :unknown


    def initialize(system)
      @system = system
    end

    def dry?(t)
      system.sun_aligned?(t) && system.planets_aligned?(t)
    end

    def rain?(t)
      !system.planets_aligned?(t) && system.sun_contained?(t)
    end

    def rain_incidence(t)
      system.planets_area(t)
    end

    def optimum?(t)
      !system.sun_aligned?(t) && system.planets_aligned?(t)
    end

    # Optimized
    def forecast(t)
      if system.planets_aligned?(t)
        if system.sun_aligned?(t)
          Forecast.new(DRY, -1)
        else
          Forecast.new(OPTIMUM, 0)
        end
      else
        if system.sun_contained?(t)
          Forecast.new(RAIN, rain_incidence(t))
        else
          Forecast.new(UNKNOWN, nil)
        end
      end
    end

    class Forecast
      attr_reader :forecast, :rain_incidence
      def initialize(forecast, rain_incidence)
        @forecast = forecast
        @rain_incidence = rain_incidence
      end
    end
  end
end