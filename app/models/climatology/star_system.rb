module Climatology
  class StarSystem
    attr_reader :start, :planets

    DELTA = 0.01

    def initialize(star, *planets)
      @star = star
      @planets = planets
    end

    def planets_alinged?(t)
      Triangle.new(planens[0].position(t), planets[1].position(t), planets[2].position(t)).area < DELTA
    end

    def sun_alinged?(t)
      Triangle.new(planens[0].position(t), planets[1].position(t), planets[2].position(t)).area < DELTA
    end

    def sun_contained?(t)
      Triangle.new()
    end

  end
end