class Journey
    attr_reader :entry_station, :exit_station, :full_journey, :fare
    
    PENALTY_FARE = 6
    ACTUAL_FARE = 3

    def initialize
        @entry_station = entry_station
        @fare = PENALTY_FARE
    end

    def enter(station)
        @entry_station = station
        @full_journey = { :a => @entry_station, :b => nil? }
    end

    def exit(station)
        @fare = ACTUAL_FARE if !full_journey[:a].nil?
        @exit_station = station
        @full_journey = { :a => @entry_station, :b => @exit_station }
        @exit_station
    end
    
    def full_journey
        @full_journey = { :a => @entry_station, :b => @exit_station }
    end

    def in_journey?
        !full_journey[:a].nil? && full_journey[:b].nil?
    end
end