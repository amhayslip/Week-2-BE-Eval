require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../tennis'

describe Tennis::Game do
  let(:game) { Tennis::Game.new }

  describe '.initialize' do
    it 'creates two players' do
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end

    it 'sets the opponent for each player' do
      expect(game.player1.opponent).to eq(game.player2)
      expect(game.player2.opponent).to eq(game.player1)
    end
  end

  describe '#wins_ball' do
    it 'increments the points of the winning player' do
      game.wins_ball(game.player1)

      expect(game.player1.points).to eq(1)
    end
  end

  describe '#game_play' do
    context 'when one player has 4 points and the other has 5' do
      it 'sets the leading players state to be advantage' do
        4.times {game.wins_ball(game.player1)}
        5.times {game.wins_ball(game.player2)}
        game.game_play(game.player1, game.player2)

        expect(game.player2.state).to eq('advantage')
    end
  end

    context 'when both players scores are at least 3 and tied' do
      it 'sets both players state to deuce' do
        3.times {game.wins_ball(game.player1)}
        3.times {game.wins_ball(game.player2)}
        game.game_play(game.player1, game.player2)

        expect(game.player1.state).to eq('deuce')
        expect(game.player1.state).to eq('deuce')
    end
  end

    context 'when one players score is at least 4 and 2 greater than his opponent' do
      it 'increments the winning players wins by 1' do
        5.times {game.wins_ball(game.player1)}
        3.times {game.wins_ball(game.player2)}
        game.game_play(game.player1, game.player2)

        expect(game.player1.wins).to eq(1)
     end
   end

  describe '#check_sets'  do
    context 'when one player wins at least 6 games and at least two more than his oppenent' do
      it 'increment the winning players set wins by 1' do
      5.times {game.wins_ball(game.player1)}
      3.times {game.wins_ball(game.player2)}
      game.game_play(game.player1, game.player2)
      expect(game.player1.wins).to eq(1)

      5.times {game.wins_ball(game.player1)}
      3.times {game.wins_ball(game.player2)}
      game.game_play(game.player1, game.player2)
      expect(game.player1.wins).to eq(2)

      5.times {game.wins_ball(game.player1)}
      3.times {game.wins_ball(game.player2)}
      game.game_play(game.player1, game.player2)
      expect(game.player1.wins).to eq(3)

      5.times {game.wins_ball(game.player1)}
      3.times {game.wins_ball(game.player2)}
      game.game_play(game.player1, game.player2)
      expect(game.player1.wins).to eq(4)

      5.times {game.wins_ball(game.player1)}
      3.times {game.wins_ball(game.player2)}
      game.game_play(game.player1, game.player2)
      expect(game.player1.wins).to eq(5)

      5.times {game.wins_ball(game.player1)}
      3.times {game.wins_ball(game.player2)}
      game.game_play(game.player1, game.player2)
      expect(game.player1.wins).to eq(6)

      game.check_sets(game.player1, game.player2)
      expect(game.player1.set_wins).to eq(1)    
      end
    end
  end


  end
end

describe Tennis::Player do
  let(:player) do
    player = Tennis::Player.new
    player.opponent = Tennis::Player.new

    return player
  end

  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!

      expect(player.points).to eq(1)
    end
  end

  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        expect(player.score).to eq('love')
      end
    end
    
    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1

        expect(player.score).to eq('fifteen')
      end 
    end
    
    context 'when points is 2' do
      it 'returns thirty' do
        player.points = 2

        expect(player.score).to eq('thirty')
      end
    end
    
    context 'when points is 3' do
      it 'returns forty' do
        player.points = 3

        expect(player.score).to eq ('forty')
      end  
    end
  end
end









