require './lib/journey.rb'

class JourneyLog
    attr_reader :journey_class, :journey, :journeys

    def initialize(journey_class = Journey)
        @journey_class = journey_class
        @journeys = []
    end
    
    def start(entry_station)
        if !@journey.nil?
            @journeys.push({ :a => @journey.entry_station, :b => nil }) if !@journey.entry_station.nil? && @journey.exit_station.nil?
        end
        @journey = Journey.new
        @journey.enter(entry_station)
    end

    def finish(exit_station)
        self.current_journey
        @journey.exit(exit_station)
        @journeys.push({ :a => @journey.entry_station, :b => @journey.exit_station })
    end

    def journeys
        @journeys.dup
    end

    private

    def current_journey
        @journey ||= Journey.new
    end
end