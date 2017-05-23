require './lib/placement_rules'

class ComputerPlacement

  attr_reader :computer_board

  def initialize
    @computer_board = PlacementRules.new
    @random_num = random_num

  end

  def comp_first_choice
    computer_board.first_placement(random_num)
  end

  

  def random_num
    random_num = ""
    num_gen = (1..4)
    letter_gen = ["a", "b", "c", "d"]
    random_num = letter_gen.sample + rand(num_gen).to_s
  end



end
