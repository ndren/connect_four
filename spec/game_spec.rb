# frozen_string_literal: true

require_relative '../lib/game'
describe Game do
  describe '#move' do
    context '7x7 board' do
      it 'changes the board in the right way' do
        game = Game.new(7)
        game.move(2)
        expected_board = [[' ', ' ', ' ', ' ', ' ', ' ', ' '], \
                          [' ', ' ', ' ', ' ', ' ', ' ', ' '], \
                          [' ', ' ', ' ', ' ', ' ', ' ', ' '], \
                          [' ', ' ', ' ', ' ', ' ', ' ', ' '], \
                          [' ', ' ', ' ', ' ', ' ', ' ', ' '], \
                          [' ', ' ', ' ', ' ', ' ', ' ', ' '], \
                          [' ', ' ', 'X', ' ', ' ', ' ', ' ']]
        actual_board = game.instance_variable_get(:@board)
        expect(actual_board).to eql(expected_board)
      end
      it 'continues along the right path' do
        game = Game.new(7)
        game.move(2)
        game.move(2)
        expected_board = [[' ', ' ', ' ', ' ', ' ', ' ', ' '], \
                          [' ', ' ', ' ', ' ', ' ', ' ', ' '], \
                          [' ', ' ', ' ', ' ', ' ', ' ', ' '], \
                          [' ', ' ', ' ', ' ', ' ', ' ', ' '], \
                          [' ', ' ', ' ', ' ', ' ', ' ', ' '], \
                          [' ', ' ', 'O', ' ', ' ', ' ', ' '], \
                          [' ', ' ', 'X', ' ', ' ', ' ', ' ']]
        actual_board = game.instance_variable_get(:@board)
        expect(actual_board).to eql(expected_board)
      end
    end
  end
  describe '#check_game_state' do
    context '3x3 board' do
      it 'declares draw' do
        game = Game.new(3)
        moves = [0, 1, 2]
        moves.each do |i|
          3.times do
            game.move(i)
          end
        end
        expected_game_state = 1
        actual_game_state = game.check_game_state
        expect(actual_game_state).to eql(expected_game_state)
      end
    end
  end
end
