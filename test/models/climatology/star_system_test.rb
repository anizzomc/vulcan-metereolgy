module Climatology

  class StarSystemTest < ActiveSupport::TestCase
    def setup
      @system = StarSystemFactory.build_system
    end


    test "Initial State" do
      t = 0
      assert @system.planets_aligned?(t)
      assert @system.sun_aligned?(t)
      assert !@system.sun_contained?(t), "Sun shouldn't be contained"
    end

    test "After 45" do
      t = 45
      assert !@system.planets_aligned?(t)
      assert !@system.sun_aligned?(t)
      assert !@system.sun_contained?(t)
    end

    test "After 90" do
      t = 90
      assert @system.planets_aligned?(t)
      assert @system.sun_aligned?(t)
    end


  end
end