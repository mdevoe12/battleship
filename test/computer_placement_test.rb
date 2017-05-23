require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_placement'

class ComputerPlacementTest < Minitest::Test

  def test_if_create_class_works
    computerplacement = ComputerPlacement.new

  end

  def test_if_first_placement_works
    computerplacement = ComputerPlacement.new
    actual = computerplacement.first_placement("a1")
    expected = "x1"

    assert_equal expected, actual
  end

  def test_if_second_placement_works
    computerplacement = ComputerPlacement.new
    computerplacement.first_placement("a1")
    actual = computerplacement.second_placement("a1")
    expected = "x2"

    assert_equal expected, actual
  end

end
