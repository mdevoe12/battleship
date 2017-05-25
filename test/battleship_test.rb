require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'

class BattleshipTest < Minitest::Test

  def test_if_create_class_works
    game = Battleship.new

  end

  # def test_if_shot_works
  #   game = Game.new
  #
  #   actual = check("b1")
  #   expected = "M"
  #
  #   assert_equal expected, actual
  # end




end
