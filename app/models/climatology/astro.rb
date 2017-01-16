module Climatology
  class Astro
    attr_reader :radius, :theta, :velocity
      # radius in kms
      # valocity in degrees/day
      # initial initial degress

    def initialize(radius, velocity, initial=0)
      @radius = radius
      @velocity = velocity
      @theta = initial
    end

    def position(t)
      Geometry::Point.new(
          radius*Math.cos(to_rad(theta+t*velocity)).round(4),
          radius*Math.sin(to_rad(theta+t*velocity)).round(4))
    end

    private

    def to_rad(g)
      g*((Math::PI)/180)
    end
  end
end