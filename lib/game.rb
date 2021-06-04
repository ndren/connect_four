# frozen_string_literal: true

require_relative './board'
# Game codes...
# -2: column is outside the board.
# -1: column is filled.
# 0: move finished, play on.
# 1: draw.
# 2: X wins.
# 3: O wins.
class Game
  def initialize(size)
    @size = size
    @board = Board.new(size).initial_layout
    @turn = 'X'
  end

  def move(column)
    return -2 if @size < column

    board_by_columns = @board.transpose
    valid_location = find_last(board_by_columns[column])
    return -1 if valid_location == -1

    board_by_columns[column][valid_location] = @turn
    change_turn
    @board = board_by_columns.transpose
  end

  def find_last(column)
    last = -1
    column.each_with_index do |item, idx|
      last = idx if item == ' '
    end
    last
  end

  def change_turn
    case @turn
    when 'X'
      @turn = 'O'
    when 'O'
      @turn = 'X'
    end
  end

  def check_game_state
    return 3 if check_win('O')
    return 2 if check_win('X')
    return 1 if check_draw

    0
  end

  def check_win(_player)
    false
  end

  def check_draw
    @board.flatten.none? do |hole|
      hole == ' '
    end
  end
end
