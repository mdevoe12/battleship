require './lib/board'
require 'pry'

class Computer
  EMPTY_BOARD = {
    "a" => [nil, "", "", "", ""],
    "b" => [nil, "", "", "", ""],
    "c" => [nil, "", "", "", ""],
    "d" => [nil, "", "", "", ""]
  }

  attr_reader :previous_ship_placement,
              :board

  def initialize
    @board = EMPTY_BOARD
    @previous_placement = ""
    @options = []
  end

  def run
    ship_one_first_placement(random_num)
    ship_one_second_placement
    binding.pry
  end

  def ship_one_first_placement(selection)
    @board[selection[0]][selection[1].to_i] = "x1"
    @previous_placement = selection
    placement_options
  end

  def ship_one_second_placement
    selection = @options.sample
    @board[selection[0]][selection[1].to_i] = 'x2'
  end

  def validate_selection(selection)
    key = selection[0]
    index = selection[1].to_i
    
    placement_options
    binding.pry
  end
  
  def placement_options
    @options = create_vertical_options + create_horiz_options
  end

  def create_vertical_options
    valid_keys = {
      'a' => ['b'],
      'b' => ['a', 'c'],
      'c' => ['b', 'd'],
      'd' => ['c']
    }

    valid_keys[@previous_placement[0]].map { |key| key + @previous_placement[1] }
  end

  def create_horiz_options
    determine_valid_indeces.map { |index| @previous_placement[0] + index }
  end

  def determine_valid_indeces
    if @previous_placement[1] == '1'
      ['2']
    elsif @previous_placement[1] == '4'
      ['3']
    else
      indeces = []
      indeces << (@previous_placement[1].to_i + 1).to_s
      indeces << (@previous_placement[1].to_i - 1).to_s
    end
  end

  def random_placement
    random_number = ""
    num_gen = rand(1..4)
    letter_gen = ["a", "b", "c", "d"]
    random_number = letter_gen.sample + num_gen.to_s
  end

  def wipe_board
    @board = EMPTY_BOARD
  end
end
