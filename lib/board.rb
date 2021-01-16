class Board
  LAYOUT = {
    "a" => [nil, "", "", "", ""],
    "b" => [nil, "", "", "", ""],
    "c" => [nil, "", "", "", ""],
    "d" => [nil, "", "", "", ""]
  }

  attr_reader :player_side, :computer_side

  def initialize
    @player_side = LAYOUT.clone
    @computer_side = LAYOUT.clone
  end
end
