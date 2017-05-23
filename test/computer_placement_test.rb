require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_placement'

class ComputerPlacementTest < Minitest::Test

  def test_if_it_creates
    computerplacement = ComputerPlacement.new

  end

end
