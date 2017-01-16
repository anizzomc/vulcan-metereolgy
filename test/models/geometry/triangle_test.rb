require 'test_helper'

module Geometry
  class TriangleTest < ActiveSupport::TestCase
    test "Area in (0,3), (2,0), (0,0) " do
      t = Triangle.new(
          Point.new(0,3),
          Point.new(2,0),
          Point.new(0,0)
      )
      assert_in_delta(t.area, 3, 0.001)
    end

    test "Area in (-1,0), (1,0), (0,1) " do
      t = Triangle.new(
          Point.new(-1,0),
          Point.new(1,0),
          Point.new(0,1)
      )
      assert_in_delta(t.area, 1, 0.001)
    end

    test "Area in (-1,3), (-2,1), (-1.5,2)" do
      t = Triangle.new(
          Point.new(-1.0, 3.0),
          Point.new(-2.0, 1.0),
          Point.new(-1.5, -2.0)
      )
      assert_in_delta(t.area, 2.0, 0.001)
    end


    test "Aligned in (-1,3), (-2,1), (-1.5,2)" do
      t = Triangle.new(
          Point.new(0.0, 0.0),
          Point.new(1.0, 0.5),
          Point.new(3.0, 1.5)
      )
      assert_in_delta(t.area, 0.0, 0.001)
    end

    test "Point Contained" do
      t = Triangle.new(
          Point.new(-1.0, 3.0),
          Point.new(-2.0, -1.0),
          Point.new(-1.5, -2.0)
      )
      assert t.contains?(Point.new(-1.5, -1))
    end


    test "Point Not Contained" do
      t = Triangle.new(
          Point.new(-1.0, 3.0),
          Point.new(-2.0, -1.0),
          Point.new(-1.5, -2.0)
      )
      assert !t.contains?(Point.new(0, -1))
    end



  end
end