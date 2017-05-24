require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/player_placement'

class PlayerPlacementTest < Minitest::Test

  def test_if_create_class_works
    player_placement = PlayerPlacement.new

  end

  def test_if_x_first_works
    player_placement = PlayerPlacement.new
    actual = player_placement.x_first_placement("d1")
    expected = "x1"

    assert_equal expected, actual
  end

#   def test_if_x_first_off_grid_fails
#     player_placement = PlayerPlacement.new
#     actual = player_placement.x_first_placement("e1")
#     expected = "that option is not valid, please choose another option"
# binding.pry
#     assert_equal expected, actual
#   end

end
