class Passenger
    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(str)
        return @flight_numbers.include?(str.upcase)
    end

    def add_flight(str)
        return if self.has_flight?(str.upcase)
        @flight_numbers << str.upcase
    end    
end