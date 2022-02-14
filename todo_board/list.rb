require_relative "item.rb"
class List 
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        return false if !Item.valid_date?(deadline)
        item = Item.new(title, deadline, description)
        @items << item
        return true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0 || index >= self.size
        return true    
    end

    def swap(index1, index2)
        return false if !valid_index?(index1) || !valid_index?(index2)
        @items[index1], @items[index2] = @items[index2], @items[index1] # i think the error was using self as opposed to just @items, since @items is an instance variable anyways?
        return true
    end

    def [](index) ##using this means that while a user can see what is at the index(if valid), they cannot manipulate it into having non-Item class variables/instances!!
        return nil if !self.valid_index?(index)
        @items[index] 
    end

    def priority
        return self[0]
    end

    def print
        puts "------------------------------------------"
        puts " " * 16 + self.label.upcase
        puts "------------------------------------------"
        puts "#{"Index".ljust(5)} | #{"Item".ljust(20)} | Deadline"
        puts "------------------------------------------"
        @items.each_with_index do |item, idx|
            puts "#{idx.to_s.ljust(5)} | #{item.title.ljust(20)} | #{item.deadline}"
        end
        puts "------------------------------------------"
    end


end
