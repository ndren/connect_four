require_relative '../lib/board.rb'
describe Board do
  describe '#initial_layout' do
    context 'size seven' do
      it 'returns board of size seven' do
        board = Board.new(7)
        expected_layout = [[' ', ' ', ' ', ' ', ' ', ' ', ' '], \
        [' ', ' ', ' ', ' ', ' ', ' ', ' '], \
        [' ', ' ', ' ', ' ', ' ', ' ', ' '], \
        [' ', ' ', ' ', ' ', ' ', ' ', ' '], \
        [' ', ' ', ' ', ' ', ' ', ' ', ' '], \
        [' ', ' ', ' ', ' ', ' ', ' ', ' '], \
        [' ', ' ', ' ', ' ', ' ', ' ', ' ']]
        actual_layout = board.initial_layout
        expect(actual_layout).to eql(expected_layout)
      end
    end
  end
end
