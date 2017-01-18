module Climatology
  class WeatherStatictics
    attr_reader :data, :stats
    def initialize(data)
      @data = data
      @stats = build_data
    end


    private
    def build_data
      prev_state = nil

      stats = Hash.new(0)

      data.each do |entry|
        if entry.forecast != prev_state
          prev_state = entry.forecast
          stats[prev_state] += 1
        end

        if entry.rain? && entry.rain_incidence > stats[:max_rain]
          stats[:max_rain] = entry.rain_incidence
          stats[:max_rain_day] = entry.day
        end
      end

      stats
    end

    end
end