class Station

    attr_reader :name, :zone

    STATIONS = { ["Old Street", "Liverpool Street", "Oxford Circus"] => 1 ,
    ["Bethnal Green", "Mile End"] => 2, ["Epping"] => 6 }

    def initialize(name, zone)
        @name = name
        @zone = zone
    end
end


