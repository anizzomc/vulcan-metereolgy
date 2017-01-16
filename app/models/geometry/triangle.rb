module Geometry
  class Triangle
    attr_reader :a, :b, :c

    def initialize(*args)
      @a, @b, @c = args
    end


    def area
      ((a.x * (b.y - c.y) + b.x * (c.y - a.y) + c.x * (a.y - b.y)) / 2.0).abs
    end

    def contains?(point)
      ab = Segment.new(a, b).length
      bc = Segment.new(b, c).length
      ac = Segment.new(c, a).length
      ad = Segment.new(a, point).length
      bd = Segment.new(b, point).length
      cd = Segment.new(c, point).length

      (ab > ad &&
        ab > bd &&
        bc > cd &&
        bc > bd &&
        ac > ad &&
        ac > cd)
    end

    def perimeter
      Segment.new(a, b).length +
        Segment.new(b, c).length +
        Segment.new(c, a).length
    end
  end
end