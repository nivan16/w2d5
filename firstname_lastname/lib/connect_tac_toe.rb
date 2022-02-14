class ConnectTacToe

    def initialize(snum, height)
        @board = Board.new(snum, height)
        @player_1 = Player.new('y')
        @player_2 = Player.new('b')
        @current_player = @player_1
    end

    def switch_players!
        if @current_player == @player_2
            @current_player = @player_1
        else
            @current_player = @player_2
        end
    end

    def play_turn
        @board.add(@current_player.token, @current_player.get_stack_index)
        self.switch_players!
    end
end