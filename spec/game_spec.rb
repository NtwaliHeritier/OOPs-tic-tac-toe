require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

describe Game do
  let(:game){ Game.new }
  let(:combination) { [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ] }
  let(:player1) { game.player1 }
  let(:player2) { game.player2 }
  let(:game_array) { game.game_array }
  let(:player1_array) { [1, 3, 5, 6, 7] }
  let(:player2_array) { [2, 4, 8, 9] }

  describe '#check_win?' do
    it 'returns true if the array combination of player matches the win combination' do
      expect(game.check_win?(combination, player1_array)).to be true
    end

    it 'returns false if the array combination of player does not match the win combination' do
      expect(game.check_win?(combination, player2_array)).to be false
    end
  end
end
