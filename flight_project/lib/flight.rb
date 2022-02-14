class Flight

    def initialize(flight_number, cap)
        @flight_number = flight_number
        @capacity = cap
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full?
        return @passengers.length >= @capacity
    end

    def board_passenger(passenger)
        return if self.full?
        @passengers << passenger if passenger.has_flight?(@flight_number)
    end

    def list_passengers
        names = []
        @passengers.each {|passenger| names << passenger.name             }
        names
    end
    
    def [](index)
        return @passengers[index]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end




end