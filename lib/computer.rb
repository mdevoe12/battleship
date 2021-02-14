require './lib/board'

class Computer
  ROWS = %i(a b c d).freeze
  MARKERS = %w[x1 x2 y1 y2].freeze

  attr_accessor :board, :random_tries, :previous_placement, :previous_row, :previous_column

  def initialize(layout:)
    @board = layout
    @previous_placement = nil
    @previous_row = nil
    @previous_column = nil
    @random_tries = 0
  end

  def call
    wipe_board
    MARKERS.each { |marker| try_placement(random_row, random_column, marker) }
    y_third_placement(random_row, random_column)
  end

  private

  def try_placement(row, column, marker)
    if marker.include?('1')
      set_placement(row, column, marker)
    else
      result = get_result_range(row, column)
      [-1, 1].include?(result) ? set_placement(row, column, marker) : retry_placement(marker)
    end
  end

  def y_third_placement(row, column)
    retry_placement(:y_third_placement) unless selection_empty?(row, column)

    if row == previous_row && previous_ship_placement('y1')[0] == row
      result = get_result_range(row, column)

      [-1, 1].include?(result) ? set_placement(row, column, 'y3') : retry_placement(:y_third_placement)
    elsif column == previous_column && previous_ship_placement('y1')[1] == column
      [-1, 1].include?(result) ? set_placement(row, column, 'y3') : retry_placement(:y_third_placement)
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
    board[row][column] == nil
  end

  def set_placement(row, column, marker)
    board[row][column] = marker
    self.previous_row = row
    self.previous_column = column
  end

  def retry_placement(marker)
    increment_tries
    check_random_tries
    send(:try_placement, random_row, random_column, marker)
  end

  def get_result_range(row, column)
    return unless selection_empty?(row, column)

    return previous_column - column if row == previous_row

    if column == previous_column
      previous_row_index = ROWS.index(previous_row)
      row_index = ROWS.index(row)

      previous_row_index - row_index
    end
  end
end
