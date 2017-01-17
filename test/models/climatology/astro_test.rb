require 'test_helper'

module Climatology


  class AstroTest < ActiveSupport::TestCase

    test "Initial Position Sun" do
      sun = Astro.new(0, 0)
      assert_equal(sun.position(0), Geometry::Point.new(0, 0))

      planet = Astro.new(100, 0, 90)
      assert_equal(planet.position(0), Geometry::Point.new(0, 100))

    end

    test "Position Planet" do
      planet = Astro.new(100, 1)

      # Orbital Description
      assert_equal(planet.position(0), Geometry::Point.new(100, 0))
      assert_equal(planet.position(45), Geometry::Point.new(70.71, 70.71))
      assert_equal(planet.position(90), Geometry::Point.new(0, 100))
      assert_equal(planet.position(180), Geometry::Point.new(-100, 0))
      assert_equal(planet.position(360), Geometry::Point.new(100, 0))

      # Double Speed
      planet = Astro.new(100, 2)
      assert_equal(planet.position(45), Geometry::Point.new(0, 100))


      #Anti Speed
      planet = Astro.new(100, -2)
      assert_equal(planet.position(45), Geometry::Point.new(0, -100))

    end


  end
end