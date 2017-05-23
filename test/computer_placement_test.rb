require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_placement'

class ComputerPlacementTest < Minitest::Test

  def test_if_it_creates
    computerplacement = ComputerPlacement.new

  end

  def test_if_it_can_place_first_spot
    computerplacement = ComputerPlacement.new
    actual = computerplacement.computer_board.first_placement("a1")
    expected = "x1"

    assert_equal expected, actual
  end

  def test_if_random_num_is_string
    computerplacement = ComputerPlacement.new
    actual = computerplacement.random_num.class
    expected = "xx".class

    assert_equal expected, actual
  end

  def test_if_comp_first_choice_works
    computerplacement = ComputerPlacement.new
    actual = computerplacement.comp_first_choice
    expected = "x1"
binding.pry
    assert_equal expected, actual
  end

end
