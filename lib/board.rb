class Board
  def initialize(size)
    @size = size
  end
  def initial_layout
    board = []
    column = []
    @size.times do
      column.append(' ')
    end
    @size.times do
      board.append(column.clone)
    end
    board
  end
end

