require './lib/board'

class Computer
  attr_accessor :board, :random_tries, :previous_placement

  def initialize(layout:)
    @board = layout
    @previous_placement = ''
    @random_tries = 0
  end

  def run
    wipe_board
    x_first_placement(random_num)
    x_second_placement(random_num)
    y_first_placement(random_num)
    y_second_placement(random_num)
    y_third_placement(random_num)
  end

  def x_first_placement(selection_one)
    board[selection_one[0]][selection_one[1].to_i] = 'x1'
  end

  def x_second_placement(selection_two)
    if board[selection_two[0]][selection_two[1].to_i] != ''
      increment_tries
      check_random_tries
      x_second_placement(random_num)
    elsif selection_two[0] == previous_placement[0]
      if previous_ship_placement('x1')[1].to_i - selection_two[1].to_i == -1
        board[selection_two[0]][selection_two[1].to_i] = 'x2'
      elsif previous_ship_placement('x1')[1].to_i - selection_two[1].to_i == 1
        board[selection_two[0]][selection_two[1].to_i] = 'x2'
      else
        increment_tries
        check_random_tries
        x_second_placement(random_num)
      end
    elsif selection_two[1] == previous_ship_placement('x1')[1]
      if previous_ship_placement('x1')[0].ord - selection_two[0].ord == -1
        board[selection_two[0]][selection_two[1].to_i] = 'x2'
      elsif previous_ship_placement('x1')[0].ord - selection_two[0].ord == 1
        board[selection_two[0]][selection_two[1].to_i] = 'x2'
      else
        increment_tries
        check_random_tries
        x_second_placement(random_num)
      end
    else
      increment_tries
      check_random_tries
      x_second_placement(random_num)
    end
  end

  def y_first_placement(selection_three)
    if board[selection_three[0]][selection_three[1].to_i] == ''
      board[selection_three[0]][selection_three[1].to_i] = 'y1'
    else
      increment_tries
      check_random_tries
      y_first_placement(random_num)
    end
  end

  def y_second_placement(selection_four)
    if board[selection_four[0]][selection_four[1].to_i] != ''
      increment_tries
      check_random_tries
      y_second_placement(random_num)
    elsif selection_four[0] == previous_ship_placement('y1')[0]
      if previous_ship_placement('y1')[1].to_i - selection_four[1].to_i == -1
        board[selection_four[0]][selection_four[1].to_i] = 'y2'
      elsif previous_ship_placement('y1')[1].to_i - selection_four[1].to_i == 1
        board[selection_four[0]][selection_four[1].to_i] = 'y2'
      else
        increment_tries
        check_random_tries
        y_second_placement(random_num)
      end
    elsif selection_four[1] == previous_ship_placement('y1')[1]
      if previous_ship_placement('y1')[0].ord - selection_four[0].ord == -1
        board[selection_four[0]][selection_four[1].to_i] = 'y2'
      elsif previous_ship_placement('y1')[0].ord - selection_four[0].ord == 1
        board[selection_four[0]][selection_four[1].to_i] = 'y2'
      else
        increment_tries
        check_random_tries
        y_second_placement(random_num)
      end
    else
      increment_tries
      check_random_tries
      y_second_placement(random_num)
    end
  end

  def y_third_placement(selection_five)
    if board[selection_five[0]][selection_five[1].to_i] != ''
      increment_tries
      check_random_tries
      y_third_placement(random_num)
    elsif (selection_five[0] == previous_ship_placement('y2')[0]) &&
          (previous_ship_placement('y1')[0] == selection_five[0])
      if previous_ship_placement('y2')[1].to_i - selection_five[1].to_i == -1
        board[selection_five[0]][selection_five[1].to_i] = 'y3'
      elsif previous_ship_placement('y2')[1].to_i - selection_five[1].to_i == 1
        @board[selection_five[0]][selection_five[1].to_i] = 'y3'
      else
        increment_tries
        check_random_tries
        y_third_placement(random_num)
      end
    elsif (selection_five[1] == previous_ship_placement('y2')[1]) &&
          (previous_ship_placement('y1')[1] == selection_five[1])
      if previous_ship_placement('y2')[0].ord - selection_five[0].ord == -1
        board[selection_five[0]][selection_five[1].to_i] = 'y3'
      elsif previous_ship_placement('y2')[0].ord - selection_five[0].ord == 1
        board[selection_five[0]][selection_five[1].to_i] = 'y3'
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

  def random_num
    letter_gen = %w[a b c d]
    num_gen = rand(1..4)

    letter_gen.sample + num_gen.to_s
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
end
