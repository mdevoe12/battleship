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
    actual = computerplacement.x_first_placement("a1")
    expected = "x1"

    assert_equal expected, actual
  end

  def test_if_second_placement_works
    computerplacement = ComputerPlacement.new
    computerplacement.x_first_placement("a1")
    actual = computerplacement.x_second_placement("a1")
    expected = "x2"

    assert_equal expected, actual
  end

  def test_if_y_first_placement_works
    computerplacement = ComputerPlacement.new
    computerplacement.x_first_placement("a1")
    computerplacement.x_second_placement("a1")
    actual = computerplacement.y_first_placement("a1")
    expected = "y1"

    assert_equal expected, actual
  end

  def test_if_y_second_placement_works
    computerplacement = ComputerPlacement.new
    computerplacement.x_first_placement("a1")
    computerplacement.x_second_placement("a1")
    computerplacement.y_first_placement("a1")
    actual = computerplacement.y_second_placement("a1")
    expected = "y2"

    assert_equal expected, actual
  end

  def test_if_y_third_placement_works
    computerplacement = ComputerPlacement.new
    computerplacement.x_first_placement("a1")
    computerplacement.x_second_placement("a3")
    computerplacement.y_first_placement("d1")
    computerplacement.y_second_placement("c2")
    actual = computerplacement.y_third_placement("a1")
    expected = "y3"

    assert_equal expected, actual
  end

end
