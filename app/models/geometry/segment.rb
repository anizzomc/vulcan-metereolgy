module Geometry
  class Segment
    attr_reader :a, :b

    def initialize(a, b)
      @a = a
      @b = b
    end

    def length
      Math.sqrt(((b.x-a.x)**2) +  ((b.y - a.y)**2))
    end
  end
end