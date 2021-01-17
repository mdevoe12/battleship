require './lib/side.rb'

class Board
  attr_reader :player_side, :computer_side

  def initialize
    @player_side = Side.new.layout
    @computer_side = Side.new.layout
  end
end
