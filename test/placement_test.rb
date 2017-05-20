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
    expected = "s2"
    actual = placement.first_placement("a1")

    assert_equal expected, actual
  end

  def test_if_first_placement_rejects_nil_selection
    placement = Placement.new
    expected = nil
    actual = placement.first_placement("a0")

    assert_nil expected, actual
  end

  def test_if_second_placement_works
    placement = Placement.new
    placement.second_placement

  end



end
