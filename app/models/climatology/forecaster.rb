module Climatology
  class Forecaster
    attr_reader :system

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
          Forecast.new(:dry, -1)
        else
          Forecast.new(:optimum, 0)
        end
      else
        if system.sun_contained?(t)
          Forecast.new(:rain, rain_incidence(t))
        else
          Forecast.new(:unknown, nil)
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