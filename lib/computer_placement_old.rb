require './lib/placement_rules'

class ComputerPlacement

  attr_reader :computer_board

  def initialize
    @computer_board = PlacementRules.new
    @random_num = random_num
    # @x2 = second_placement(random_num)

    run
  end

  def run
    x1
    x2
  end


  def x1
    @computer_board.first_placement(random_num)
  end

  def x2
    @computer_board.second_placement(random_num)
  end

  def comp_first_choice
    computer_board.first_placement(random_num)

  end

  def comp_second_choice
    variable = computer_board.second_placement(random_num)
    binding.pry
    if variable
      nil
      comp_second_choice
    elsif variable
      "x2"
      variable
    end

  # binding.pry
  end

  # def random_num
  #   random_number = ""
  #   num_gen = (1..4)
  #   letter_gen = ["a", "b", "c", "d"]
  #   random_number = letter_gen.sample + rand(num_gen).to_s
  #   # binding.pry
  # end



end
