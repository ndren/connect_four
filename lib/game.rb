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
    @lines = generate_lines
  end

  def adjust(source, adjustment)
    return [source[0] + adjustment[0], source[1] + adjustment[1]]
  end

  def locate(address)
    return @board.dig(address[0], address[1])
  end

  def all_eql?(arr)
    arr.uniq.size <= 1
  end

  def find_game_box_corners
    # Only need to check each 4x4 box, and the top-left edge is enough to describe each box.
    max = @size - 4
    min = 0
    set = (min..max).to_a
    boxes = []
    set.each do |y|
      set.each do |x|
        boxes.push([y, x])
      end
    end
    boxes
  end

  def generate_lines
    lines = []
    corners = find_game_box_corners
    corners.each do |corner|
      lines += generate_horizontals(corner)
      lines += generate_verticals(corner)
      lines += generate_diagonals(corner)
    end
    lines
  end

  def move(column)
    return -2 if @size < column

    board_by_columns = @board.transpose
    valid_location = find_last_index(board_by_columns[column])
    return -1 if valid_location == -1

    board_by_columns[column][valid_location] = @turn
    change_turn
    @board = board_by_columns.transpose
  end

  def find_last_index(column)
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

  def check_win(player)
    @lines.any? do |line|
      all_eql?([locate(line[0]), locate(line[1]), locate(line[2]), locate(line[3]), player])
    end
  end

  def check_draw
    @board.flatten.none? do |hole|
      hole == ' '
    end
  end

  def generate_horizontals(corner)
    return [[adjust(corner, [0, 0]), adjust(corner, [0, 1]), adjust(corner, [0, 2]), adjust(corner, [0, 3])], \
            [adjust(corner, [1, 0]), adjust(corner, [1, 1]), adjust(corner, [1, 2]), adjust(corner, [1, 3])], \
            [adjust(corner, [2, 0]), adjust(corner, [2, 1]), adjust(corner, [2, 2]), adjust(corner, [2, 3])], \
            [adjust(corner, [3, 0]), adjust(corner, [3, 1]), adjust(corner, [3, 2]), adjust(corner, [3, 3])]]
  end

  def generate_verticals(corner)
    return [[adjust(corner, [0, 0]), adjust(corner, [1, 0]), adjust(corner, [2, 0]), adjust(corner, [3, 0])], \
            [adjust(corner, [0, 1]), adjust(corner, [1, 1]), adjust(corner, [2, 1]), adjust(corner, [3, 1])], \
            [adjust(corner, [0, 2]), adjust(corner, [1, 2]), adjust(corner, [2, 2]), adjust(corner, [3, 2])], \
            [adjust(corner, [0, 3]), adjust(corner, [1, 3]), adjust(corner, [2, 3]), adjust(corner, [3, 3])]]
  end
  def generate_diagonals(corner)
    return [[adjust(corner, [0, 0]), adjust(corner, [1, 1]), adjust(corner, [2, 2]), adjust(corner, [3, 3])], \
            [adjust(corner, [3, 0]), adjust(corner, [2, 1]), adjust(corner, [1, 2]), adjust(corner, [0, 3])]]
  end
end
