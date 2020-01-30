class Journey
    attr_reader :entry_station, :exit_station, :full_journey
    
    def initialize(entry_station)
        @entry_station = entry_station
        @full_journey = {:a => entry_station, :b => "Awaiting final station"}
    end

    def exit(station)
        @exit_station = station
    end
    
    def full_journey
        { :a => @entry_station, :b => @exit_station }
    end
end