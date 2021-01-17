class Board
  attr_reader :player_side, :computer_side

  def initialize
    @player_side = layout
    @computer_side = layout
  end

  private

  def layout
    {
      "a" => [nil, "", "", "", ""],
      "b" => [nil, "", "", "", ""],
      "c" => [nil, "", "", "", ""],
      "d" => [nil, "", "", "", ""]
    }
  end
end
