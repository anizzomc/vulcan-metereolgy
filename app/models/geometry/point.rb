module Geometry
  class Point
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def == other
      self.class == other.class && x == other.x && y == other.y
    end

    def to_s
      "Point(#{x}, #{y})"
    end

  end
end