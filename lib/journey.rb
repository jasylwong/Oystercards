class Journey
    attr_reader :entry_station, :exit_station, :full_journey, :fare
    
    PENALTY_FARE = 6
    BASIC_FARE = 1

    def initialize
        @fare = PENALTY_FARE
    end

    def enter(station)
        @entry_station = station
        @full_journey = { :a => @entry_station, :b => nil }
    end

    def exit(station)
        @exit_station = station
        self.full_journey
        @fare = fare_calculator if !@entry_station.nil?
        @exit_station
        
    end
    
    def full_journey
        @full_journey = { :a => @entry_station, :b => @exit_station }
    end

    def in_journey?
        !@entry_station.nil? && @exit_station.nil?
    end

    private

    def fare_calculator
        (@entry_station.zone - @exit_station.zone).abs + BASIC_FARE if @entry_station && @exit_station
    end
end