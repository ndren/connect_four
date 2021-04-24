require_relative './board.rb'
class Game
  def initialize(size)
    @size = size
    @board = Board.new(size).initial_layout
  end
  def move(column)
    board_by_columns = @board.transpose
    board_by_columns[column][-1] = 'X'
    @board = board_by_columns.transpose
  end
end
