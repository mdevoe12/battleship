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
    board[row][column] = 'x1'

    self.previous_row = row
    self.previous_column = column
  end

  def x_second_placement(row, column)
    result = get_result_range(row, column)

    [-1, 1].include?(result) ? set_x_2(row, column) : retry_x_second_placement
  end

  def get_result_range(row, column)
    if row == previous_row
      result = previous_column - column
    end

    if column == previous_column
      previous_row_index = ROWS.index(previous_row)
      row_index = ROWS.index(row)

      result = previous_row_index - row_index
    end
  end

  def retry_x_second_placement
    increment_tries
    check_random_tries
    x_second_placement(random_row, random_column)
  end

  def set_x_2(row, column)
    board[row][column] = 'x2'
  end

  def y_first_placement(row, column)
    retry_y_first_placement unless selection_empty?(row, column)

    board[row][column] = 'y1'
    self.previous_row = row
    self.previous_column = column
  end

  def retry_y_first_placement
    increment_tries
    check_random_tries
    y_first_placement(random_row, random_column)
  end

  def y_second_placement(row, column)
    retry_y_second_placement unless selection_empty?(row, column)

    result = get_result_range(row, column)

    [-1, 1].include?(result) ? set_y_2(row, column) : retry_y_second_placement
  end

  def set_y_2(row, column)
    board[row][column] = 'y2'
    self.previous_row = row
    self.previous_column = column
  end

  def retry_y_second_placement
    increment_tries
    check_random_tries
    y_second_placement(random_row, random_column)
  end

  # def y_third_placement(selection)
  #   if !selection_empty?(selection)
  #     increment_tries
  #     check_random_tries
  #     y_third_placement(random_num)
  #   elsif (selection[0] == previous_ship_placement('y2')[0]) &&
  #         (previous_ship_placement('y1')[0] == selection[0])
  #     if previous_ship_placement('y2')[1].to_i - selection[1].to_i == -1
  #       board[selection[0]][selection[1].to_i] = 'y3'
  #     elsif previous_ship_placement('y2')[1].to_i - selection[1].to_i == 1
  #       @board[selection[0]][selection[1].to_i] = 'y3'
  #     else
  #       increment_tries
  #       check_random_tries
  #       y_third_placement(random_num)
  #     end
  #   elsif (selection[1] == previous_ship_placement('y2')[1]) &&
  #         (previous_ship_placement('y1')[1] == selection[1])
  #     if previous_ship_placement('y2')[0].ord - selection[0].ord == -1
  #       board[selection[0]][selection[1].to_i] = 'y3'
  #     elsif previous_ship_placement('y2')[0].ord - selection[0].ord == 1
  #       board[selection[0]][selection[1].to_i] = 'y3'
  #     else
  #       increment_tries
  #       check_random_tries
  #       y_third_placement(random_num)
  #     end
  #   else
  #     increment_tries
  #     check_random_tries
  #     y_third_placement(random_num)
  #   end
  # end

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
end
