require './lib/journey.rb'

class JourneyLog
    attr_reader :journey_class, :journey, :journeys

    def initialize(journey_class = Journey)
        @journey_class = journey_class
        @journeys = []
    end
    
    def start(entry_station)
        @journey = Journey.new
        @journey.enter(entry_station)
    end

    def finish(exit_station)
        self.current_journey
        @journey.exit(exit_station)
    end

    private

    def current_journey
        @journey = @journey ? @journey : Journey.new
    end
end