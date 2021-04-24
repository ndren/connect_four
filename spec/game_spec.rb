require_relative '../lib/game.rb'
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
    end
  end
end
