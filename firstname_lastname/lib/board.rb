class Board
    
    def self.build_stacks(n)
        return Array.new(n){[]}
    end
    attr_reader :max_height
    def initialize(nstacks, height)
        raise "rows and cols must be >= 4" if nstacks < 4 || height < 4
        @max_height = height
        @stacks = Board.build_stacks(nstacks)
    end

    def add(token, stackidx)
        return false if @stacks[stackidx].length >= @max_height
        @stacks[stackidx] << token
        return true
    end

    def vertical_winner?(token)
        @stacks.any?{|row| row.all?{|ele| ele == token } && row.length == @max_height }
    end

    def horizontal_winner?(token)
        
        (0...@stacks.length).each do |row|
            col_eles = []
            i = 0
            while col_eles.length < @stacks.length
                    col_eles << @stacks[i][row]
                    i += 1
            end
            
            return true if col_eles.all?{|ele| ele == token}
        end

        return false
    end

    def winner?(token)
        return self.vertical_winner?(token) || self.horizontal_winner?(token)
    end


end