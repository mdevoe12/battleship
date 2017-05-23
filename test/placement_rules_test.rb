require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/placement_rules'

class PlacementRulesTest < Minitest::Test

  def test_if_placement_create_works
    placement = PlacementRules.new
  end

  def test_if_first_placement_works
    placement = PlacementRules.new
    expected = "x1"
    actual = placement.first_placement("a1")

    assert_equal expected, actual
  end

  def test_if_first_placement_rejects_nil_selection
    placement = PlacementRules.new
    expected = nil
    actual = placement.first_placement("a0")

    assert_equal expected, actual
  end

  def test_if_second_placement_nil_works
    placement = PlacementRules.new
    placement.second_placement("a0")
    expected = nil
    actual = placement.second_placement("a0")

    assert_equal expected, actual
  end

  def test_if_second_placement_vertical_check_works
    placement = PlacementRules.new
    placement.first_placement("a1")
    expected = "x2"
    actual = placement.second_placement("b1")

    assert_equal expected, actual
  end

  def test_if_find_previous_ship_works
    placement = PlacementRules.new
    placement.first_placement("a1")
    expected = "a1"
    actual = placement.previous_ship_placement("x1")

    assert_equal expected, actual
  end

  def test_if_negative_horiz_placement_works
    placement = PlacementRules.new
    placement.first_placement("a1")
    expected = "x2"
    actual = placement.second_placement("a2")

    assert_equal expected, actual
  end

  def test_if_positive_horiz_placement_works
    placement = PlacementRules.new
    placement.first_placement("a2")
    expected = "x2"
    actual = placement.second_placement("a1")

    assert_equal expected, actual

  end

  def test_if_beyond_grid_works
    placement = PlacementRules.new
    placement.first_placement("a4")
    actual = placement.second_placement("a5")
    expected = nil

    assert_equal expected, actual
  end

  def test_if_negative_vert_placement_works
    placement = PlacementRules.new
    placement.first_placement("b1")
    actual = placement.second_placement("c1")
    expected = "x2"

    assert_equal expected, actual
  end

  def test_if_positive_vert_placement_works
    placement = PlacementRules.new
    placement.first_placement("b4")
    actual = placement.second_placement("a4")
    expected = "x2"

    assert_equal expected, actual
  end

  def test_if_not_allowed_vert_placement_works
    placement = PlacementRules.new
    placement.first_placement("a1")
    actual = placement.second_placement("c1")
    expected = nil

    assert_equal expected, actual
  end

  def test_if_b_first_placement_works
    placement = PlacementRules.new
    actual = placement.b_first_placement("a1")
    expected = "y1"

    assert_equal expected, actual
  end

  def test_if_b_first_cant_write_to_occupied
    placement = PlacementRules.new
    placement.first_placement("a1")
    actual = placement.b_first_placement("a1")
    expected = nil

    assert_equal expected, actual
  end

  def test_if_horiz_b_second_writes
    placement = PlacementRules.new
    placement.b_first_placement("a2")
    actual = placement.b_second_placement("a1")
    expected = "y2"

    assert_equal expected, actual
  end

  def test_if_vert_b_second_writes
    placement = PlacementRules.new
    placement.b_first_placement("b2")
    actual = placement.b_second_placement("a2")
    expected = "y2"

    assert_equal expected, actual
  end

  def test_if_write_b_second_fails_on_occupied
    placement = PlacementRules.new
    placement.first_placement("a2")
    placement.b_first_placement("b2")
    actual = placement.b_second_placement("a2")
    expected = nil

    assert_equal expected, actual
  end

  def test_if_index_fails_on_b_second
    placement = PlacementRules.new
    placement.first_placement("a2")
    placement.b_first_placement("b2")
    actual = placement.b_second_placement("a0")
    expected = nil

    assert_equal expected, actual
  end

  def test_if_b_north_third_runs
    placement = PlacementRules.new
    placement.b_first_placement("c1")
    placement.b_second_placement("b1")
    actual = placement.b_third_placement("a1")
    expected = "y3"

    assert_equal expected, actual

  end

  def test_ifB_south_third_runs
    placement = PlacementRules.new
    placement.b_first_placement("a1")
    placement.b_second_placement("b1")
    actual = placement.b_third_placement("c1")
    expected = "y3"

    assert_equal expected, actual
  end

  def test_if_L_shape_is_denied_vert
    placement = PlacementRules.new
    placement.b_first_placement("a1")
    placement.b_second_placement("a2")
    actual = placement.b_third_placement("b2")
    expected = nil

    assert_equal expected, actual
  end

  def test_if_L_shape_is_denied_horiz
    placement = PlacementRules.new
    placement.b_first_placement("a1")
    placement.b_second_placement("b1")
    actual = placement.b_third_placement("b2")
    expected = nil

    assert_equal expected, actual
  end

  def test_if_full_board_placement_works
    placement = PlacementRules.new
    placement.first_placement("a1")
    placement.second_placement("b1")
    placement.b_first_placement("d3")
    placement.b_second_placement("c3")
    actual = placement.b_third_placement("b3")
    expected = "y3"

    assert_equal expected, actual
  end


















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
  #   expected = false
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_north_returns_false_off_grid
  #   placement = Placement.new
  #   placement.b_first_placement("a2")
  #   actual = placement.north("a2")
  #   expected = false
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_south_returns_true
  #   placement = Placement.new
  #   placement.b_first_placement("y1")
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
  # def test_if_south_returns_false_off_grid
  #   placement = Placement.new
  #   placement.b_first_placement("c3")
  #   actual = placement.south("c3")
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
  # def test_if_east_returns_false
  #   placement = Placement.new
  #   placement.first_placement("b3")
  #   placement.b_first_placement("b1")
  #   actual = placement.east("b1")
  #   expected = false
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_east_returns_false_off_grid
  #   placement = Placement.new
  #   placement.b_first_placement("b3")
  #   actual = placement.east("b3")
  #   expected = false
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_west_returns_true
  #   placement = Placement.new
  #   placement.b_first_placement("c3")
  #   actual = placement.west("c3")
  #   expected = true
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_west_returns_false
  #   placement = Placement.new
  #   placement.first_placement("c1")
  #   placement.b_first_placement("c3")
  #   actual = placement.west("c3")
  #   expected = false
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_west_returns_false_off_grid
  #   placement = Placement.new
  #   placement.b_first_placement("c2")
  #   actual = placement.west("c2")
  #
  #   expected = false
  # end
  #
  # def test_if_b_first_relies_on_north
  #   placement = Placement.new
  #   actual = placement.b_first_placement("c1")
  #   expected = "b1"
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_b_second_works
  #   placement = Placement.new
  #   placement.b_first_placement("d3")
  #   actual = placement.b_second_placement("c3")
  #   expected = "b2"
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_b_second_fails_with_north
  #   placement = Placement.new
  #   placement.b_first_placement("b4")
  #   actual = placement.b_second_placement("a4")
  #   expected = nil
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_b_second_fails_with_south
  #   placement = Placement.new
  #   placement.b_first_placement("c4")
  #   actual = placement.b_second_placement("d4")
  #   expected = nil
  #
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_b_second_succeeds_with_south
  #   placement = Placement.new
  #   placement.b_first_placement("b4")
  #   actual = placement.b_second_placement("c4")
  #   expected = "b2"
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_b_second_succeeds_with_east
  #   placement = Placement.new
  #   placement.b_first_placement("c1")
  #   actual = placement.b_second_placement("c2")
  #   expected = "b2"
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_b_second_fails_with_east
  #   placement = Placement.new
  #   placement.b_first_placement("c3")
  #   actual = placement.b_second_placement("c4")
  #   expected = nil
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_if_b_second_succeeds_with_west
  #   placement = Placement.new
  #   placement.b_first_placement("c4")
  #   actual = placement.b_second_placement("c3")
  #   expected = "b2"
  #
  #
  #   assert_equal expected, actual
  # end




end
