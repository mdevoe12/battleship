require './lib/board'

class Computer
  ROWS = %w[a b c d].freeze

  attr_accessor :board, :random_tries, :previous_placement, :previous_row, :previous_column

  def initialize(layout:)
    @board = layout
    @previous_placement = ''
    @previous_row = nil
    @previous_column = nil
    @random_tries = 0
  end

  def run
    wipe_board
    x_first_placement(random_row, random_column)
    x_second_placement(random_row, random_column)
    y_first_placement(random_row, random_column)
    y_second_placement(random_row, random_column)
    # y_third_placement(random_num)
  end

  def x_first_placement(row, column)
    set_placement(row, column, 'x1')
  end

  def x_second_placement(row, column)
    result = get_result_range(row, column)

    [-1, 1].include?(result) ? set_placement(row, column, 'x2') : retry_placement(:x_second_placement)
  end

  def y_first_placement(row, column)
    retry_placement(:y_first_placement) unless selection_empty?(row, column)

    set_placement(row, column, 'y1')
  end

  def y_second_placement(row, column)
    result = get_result_range(row, column)

    [-1, 1].include?(result) ? set_placement(row, column, 'y2') : retry_placement(:y_second_placement)
  end

  def y_third_placement(row, column)
    retry_placement(:y_third_placement) unless selection_empty?(row, column)

    if row == previous_row &&
          (previous_ship_placement('y1')[0] == row)
      if previous_column - column == -1
        board[row][column] = 'y3'
      elsif previous_column - column == 1
        @board[row][column] = 'y3'
      else
        increment_tries
        check_random_tries
        y_third_placement(random_num)
      end
    elsif (column == previous_ship_placement('y2')[1]) &&
          (previous_ship_placement('y1')[1] == column)
      if previous_row.ord - row.ord == -1
        board[row][column] = 'y3'
      elsif previous_row.ord - row.ord == 1
        board[row][column] = 'y3'
      else
        increment_tries
        check_random_tries
        y_third_placement(random_num)
      end
    else
      increment_tries
      check_random_tries
      y_third_placement(random_num)
    end
  end

  def previous_ship_placement(input)
    board.each do |key, row|
      row.find do |index|
        next if index != input

        self.previous_placement = key + row.index(index).to_s
      end
    end

    previous_placement
  end

  def random_row
    ROWS.sample
  end

  def random_column
    rand(1..4)
  end

  def random_num
    num_gen = rand(1..4)

    ROWS.sample + num_gen.to_s
  end

  def check_random_tries
    return unless random_tries > 99

    self.random_tries = 0
    run
  end

  def wipe_board
    self.board = Board.layout
  end

  def increment_tries
    self.random_tries += 1
  end

  def selection_empty?(row, column)
    board[row][column] == ''
  end

  def set_placement(row, column, marker)
    board[row][column] = marker
    self.previous_row = row
    self.previous_column = column
  end

  def retry_placement(method)
    increment_tries
    check_random_tries
    self.send(method, random_row, random_column)
  end

  def get_result_range(row, column)
    return unless selection_empty?(row, column)

    if row == previous_row
      result = previous_column - column
    end

    if column == previous_column
      previous_row_index = ROWS.index(previous_row)
      row_index = ROWS.index(row)

      result = previous_row_index - row_index
    end
  end
end
