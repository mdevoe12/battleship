require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_if_create_class_works
    player_placement = Player.new

  end

  def test_if_x_first_works
    player_placement = Player.new
    actual = player_placement.x_first_placement("d1")
    expected = "x1"

    assert_equal expected, actual
  end

  def test_if_x_second_works_horiz
    player_placement = Player.new
    player_placement.x_first_placement("b1")
    actual = player_placement.x_second_placement("b2")
    expected = "x2"

    assert_equal expected, actual
  end

  def test_if_x_second_works_vert
    player_placement = Player.new
    player_placement.x_first_placement("b1")
    actual = player_placement.x_second_placement("a1")
    expected = "x2"

    assert_equal expected, actual
  end

  def test_if_y_first_placement_works
    player_placement = Player.new
    actual = player_placement.y_first_placement("b1")
    expected = "y1"

    assert_equal expected, actual
  end

  def test_if_y_second_placement_works
    player_placement = Player.new
    player_placement.y_first_placement("b1")
    actual = player_placement.y_second_placement("b2")
    expected = "y2"

    assert_equal expected, actual

  end

  def test_if_y_third_placement_works
    player_placement = Player.new
    player_placement.y_first_placement("c2")
    player_placement.y_second_placement("c3")
    actual = player_placement.y_third_placement("c4")
    expected = "y3"

    assert_equal expected, actual
  end

  # def test_if_x_first_off_grid_vert_fails
  #   player_placement = Player.new
  #   actual = player_placement.x_first_placement("e1")
  #   expected = "that option is not valid, please choose another option"
  #
  #   assert_equal expected, actual
  # end

  # def test_if_x_first_off_grid_horizontal_fails
  #   player_placement = PlayerPlacement.new
  #   actual = player_placement.x_first_placement("a0")
  #   expected = "that option is not valid, please choose another option"
  #
  #   assert_equal expected, actual
  # end



  # def test_if_put_on_occupied_square
  #   player_placement = PlayerPlacement.new
  #   player_placement.x_first_placement("b1")
  #   actual = player_placement.x_second_placement("b1")
  #   expected = "that option is not valid, please choose another option"
  #
  #   assert_equal expected, actual
  # end

  # def test_if_put_on_disconnected_square
  #   player_placement = PlayerPlacement.new
  #   player_placement.x_first_placement("b1")
  #   actual = player_placement.x_second_placement("b3")
  #   expected = "that option is not valid, please choose another option"
  #
  #   assert_equal expected, actual
  # end



end
