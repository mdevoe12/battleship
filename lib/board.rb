class Board
  attr_reader :player_side, :computer_side

  def initialize
    @player_side = Board.layout
    @computer_side = Board.layout
  end

  private

  def self.layout
    {
      "a" => [nil, "", "", "", ""],
      "b" => [nil, "", "", "", ""],
      "c" => [nil, "", "", "", ""],
      "d" => [nil, "", "", "", ""]
    }
  end
end
