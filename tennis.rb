module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      winner.points = winner.points + 1
      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
    end

    def game_play(player1, player2)
      if player1.points == 4 && player2.points == 5
        player2.accolade = "advantage"

      elsif player1.points >= 3 && player2.points >= 3 && player1.points == player2.points
        player1.accolade = "deuce"
        player2.accolade = "deuce"

      elsif player1.points >= 4 && player2.points == player1.points - 2
        player1.accolade = "win"
      else
        puts "hey"
      end

    end


  end

  class Player 
    attr_accessor :points, :opponent, :accolade

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'forty' if @points == 3
      return 'advantage' if @points == 4 && opponent.points == 5
    end





  end
end








