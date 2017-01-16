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
          DRY
        else
          OPTIMUM
        end
      else
        if system.sun_contained?(t)
          RAIN
        else
          UNKNOWN
        end
      end
    end
  end
end