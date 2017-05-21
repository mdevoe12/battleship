require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/placement'

class PlacementTest < Minitest::Test

  # def test_if_placement_create_works
  #   placement = Placement.new
  # end
  #
  # def test_if_first_placement_works
  #   placement = Placement.new
  #   expected = "s1"
  #   actual = placement.first_placement("a1")
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_first_placement_rejects_nil_selection
  #   placement = Placement.new
  #   expected = nil
  #   actual = placement.first_placement("a0")
  #
  #   assert_nil expected, actual
  # end
  #
  # def test_if_second_placement_nil_works
  #   placement = Placement.new
  #   placement.second_placement("a0")
  #   expected = nil
  #   actual = placement.second_placement("a0")
  #
  #   assert_nil expected, actual
  # end
  #
  # def test_if_second_placement_vertical_check_works
  #   placement = Placement.new
  #   placement.first_placement("a1")
  #   expected = "s2"
  #   actual = placement.second_placement("b1")
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_find_previous_ship_works
  #   placement = Placement.new
  #   placement.first_placement("a1")
  #   expected = "a1"
  #   actual = placement.previous_ship_placement
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_negative_horiz_placement_works
  #   placement = Placement.new
  #   placement.first_placement("a1")
  #   expected = "s2"
  #   actual = placement.second_placement("a2")
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_positive_horiz_placement_works
  #   placement = Placement.new
  #   placement.first_placement("a2")
  #   expected = "s2"
  #   actual = placement.second_placement("a1")
  #
  #   assert_equal expected, actual
  #
  # end
  #
  # def test_if_beyond_grid_works
  #   placement = Placement.new
  #   placement.first_placement("a4")
  #   actual = placement.second_placement("a5")
  #   expected = nil
  #
  #   assert_nil expected, actual
  # end
  #
  # def test_if_negative_vert_placement_works
  #   placement = Placement.new
  #   placement.first_placement("b1")
  #   actual = placement.second_placement("c1")
  #   expected = "s2"
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_positive_vert_placement_works
  #   placement = Placement.new
  #   placement.first_placement("b4")
  #   actual = placement.second_placement("a4")
  #   expected = "s2"
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_not_allowed_vert_placement_works
  #   placement = Placement.new
  #   placement.first_placement("a1")
  #   actual = placement.second_placement("c1")
  #   expected = nil
  #
  #   assert_nil expected, actual
  # end
  #
  # def test_if_b_first_placement_works
  #   placement = Placement.new
  #   actual = placement.b_first_placement("a1")
  #   expected = "b1"
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_b_first_cant_write_to_occupied
  #   placement = Placement.new
  #   placement.first_placement("a1")
  #   actual = placement.b_first_placement("a1")
  #   expected = nil
  #
  #   assert_nil expected, actual
  # end
  #
  # def test_if_north_returns_true
  #   placement = Placement.new
  #   placement.b_first_placement("c2")
  #   actual = placement.north("c2")
  #   expected = true
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_north_returns_false
  #   placement = Placement.new
  #   placement.first_placement("a2")
  #   placement.b_first_placement("c2")
  #   actual = placement.north("c2")
  #
  #   expected = false
  # end
  #
  # def test_if_south_returns_true
  #   placement = Placement.new
  #   placement.b_first_placement("b1")
  #   actual = placement.south("b1")
  #   expected = true
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_south_returns_false
  #   placement = Placement.new
  #   placement.first_placement("c1")
  #   placement.b_first_placement("b1")
  #   actual = placement.south("b1")
  #   expected = false
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_east_returns_true
  #   placement = Placement.new
  #   placement.b_first_placement("b1")
  #   actual = placement.east("b1")
  #   expected = true
  #
  #   assert_equal expected, actual
  # end
  #
  def test_if_east_returns_false
    placement = Placement.new
    placement.first_placement("b3")
    placement.b_first_placement("b1")
    actual = placement.east("b1")
    expected = false

    assert_equal expected, actual
  end

  def test_if_west_returns_true
    placement = Placement.new
    placement.b_first_placement("c3")
    actual = placement.west("c3")
    expected = true

    assert_equal expected, actual
  end

  def test_if_west_returns_false
    placement = Placement.new
    placement.first_placement("c1")
    placement.b_first_placement("c3")
    actual = placement.west("c3")
    expected = false

    assert_equal expected, actual
  end

  def test_if_b_first_relies_on_north
    placement = Placement.new
    actual = placement.b_first_placement("c1")
    expected = "b1"

    assert_equal expected, actual
  end




end
