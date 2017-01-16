module Climatology
  class StarSystemFactory
    def self.build_system
      star = Astro.new(0, 0)
      ferengy = Astro.new(500, 1)
      betasoide = Astro.new(2000, 3)
      vulcano = Astro.new(1000, -5)
      StarSystem.new(star, ferengy, betasoide, vulcano)
    end
  end
end