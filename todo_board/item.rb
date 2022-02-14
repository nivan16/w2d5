class Item
    

    # def self.valid_date?(str) ##its self.valid_date?, not Item.valid_date? not sure why though.. maybe both work and its just a convention thing?
    #     date = str.split("-")
    #     return false if date.length != 3
    #     #
    #     year = date[0]
    #     month = date[1]
    #     day = date[2]
    #     return false if year.length != 4 || ( month.length != 2 || !(1..12).include?( month.to_i) ) || ( day.length != 2 || !(1..31).include?(day.to_i) )
    #     return true
    # end
    def self.valid_date?(s) ##while mine worked, this is the solution
        parts = s.split('-').map(&:to_i)
        year, month, day = parts #this is really amazing!! the way it works is this will break the array(of integers) up into the three parts!! and it does so
                                        #by sorting it into the order (as prev learned) year = parts[0], month = parts[1], and day = parts[2]!!
        return false if parts.length != 3
        return false if !(0..12).include?(month)
        return false if !(0..31).include?(day)#unlike my code, its shown here that you dont need to test the "length" of day and month because you simply check
                                                  #if its the right number!!!
        true
    end

    attr_accessor :title, :description
    attr_reader :deadline

    def initialize(title, deadline, description)
        raise "Invalid date change input!" if !Item.valid_date?(deadline)
        @title = title
        @description = description
        @deadline = deadline
        # if Item.valid_date?(deadline) #idk how i forgot this, but i couldve just done this at the top with a simple if check one-liner at the end
        #     @deadline = deadline
        # else
        #     raise "invalid date input!"
        # end

    end

    def deadline=(new_deadline) #its deadline, not @deadline! since its a method name!!!!
        raise "Invalid date change input!" if !Item.valid_date?(new_deadline) # ^^^i mean i did it here?
        @deadline = new_deadline
    end
end
Item.valid_date?('2019-10-25') # true
Item.valid_date?('1912-06-23') # true
Item.valid_date?('2018-13-20') # false
Item.valid_date?('2018-12-32') # false
Item.valid_date?('10-25-2019') # false