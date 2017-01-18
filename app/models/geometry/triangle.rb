module Geometry
  class Triangle
    attr_reader :a, :b, :c

    def initialize(*args)
      @a, @b, @c = args
    end


    def area
      @area ||= ((a.x * (b.y - c.y) + b.x * (c.y - a.y) + c.x * (a.y - b.y)) / 2.0).abs
    end

    # http://stackoverflow.com/questions/2049582/how-to-determine-if-a-point-is-in-a-2d-triangle
    # def contains?(point)
    #   b1 = sign(point, a, b) < 0.0;
    #   b2 = sign(point, b, c) < 0.0;
    #   b3 = sign(point, c, a) < 0.0;
    #
    #   return ((b1 == b2) && (b2 == b3));
    # end

    def contains?(p)
      areaABP = Triangle.new(a, b, p).area
      areaACP = Triangle.new(a, c, p).area
      areaBCP = Triangle.new(b, c, p).area
      (areaABP + areaACP + areaBCP - area < 0.1)
    end

    def perimeter
      Segment.new(a, b).length +
        Segment.new(b, c).length +
        Segment.new(c, a).length
    end

    private
    def sign(p1, p2, p3)
      (p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y);
    end

  end
end