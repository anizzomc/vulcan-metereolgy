module Climatology
  class StarSystem
    attr_reader :star, :planets

    DELTA = 1000

    def initialize(star, *planets)
      @star = star
      @planets = planets
    end

    def planets_aligned?(t)
      build_triangle(t).area < DELTA
    end

    def sun_aligned?(t)
      Geometry::Triangle.new(planets[0].position(t), planets[1].position(t), planets[2].position(t)).area < DELTA
    end

    def sun_contained?(t)
      build_triangle(t).contains?(star.position(t))
    end

    def planets_area(t)
      build_triangle(t).area
    end

    private
    def build_triangle(t)
      Geometry::Triangle.new(planets[0].position(t), planets[1].position(t), planets[2].position(t))
    end

  end
end