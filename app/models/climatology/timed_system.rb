module Climatology
  class TimedSystem
    attr_accessor :system, :time
    def initialize(system, time)
      @system = system
      @time = time
    end

    def planets
      system.planets.map { |planet| Planet.new(planet, time)}
    end

    def planets_area
      system.planets_area(time)
    end
  end

  class Planet
    attr_accessor :planet, :time
    def initialize(planet, time)
      @planet = planet
      @time = time
    end

    def position
      planet.position(time)
    end
  end

end