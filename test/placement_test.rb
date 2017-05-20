require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/placement'

class PlacementTest < Minitest::Test

  def test_if_placement_create_works
    placement = Placement.new
  end



  def test_if_first_placement_works
    placement = Placement.new
    expected = "s1"
    actual = placement.first_placement("a1")

    assert_equal expected, actual
  end

  def test_if_first_placement_rejects_nil_selection
    placement = Placement.new
    expected = nil
    actual = placement.first_placement("a0")

    assert_nil expected, actual
  end

  def test_if_second_placement_nil_works
    placement = Placement.new
    placement.second_placement("a0")
    expected = nil
    actual = placement.second_placement("a0")

    assert_nil expected, actual
  end

  def test_if_second_placement_index_check_works
    placement = Placement.new
    placement.first_placement("a1")
    expected = "s2"
    actual = placement.second_placement("b1")

    assert_equal expected, actual
  end

  def test_if_find_previous_ship_works
    placement = Placement.new
    placement.first_placement("a1")
    expected = "s1"
    actual = placement.find_previous_ship_placement

    assert_equal expected, actual
  end





end
