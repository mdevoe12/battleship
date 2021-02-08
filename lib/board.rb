class Board
  attr_reader :player_side, :computer_side

  def initialize
    @player_side = Board.layout
    @computer_side = Board.layout
  end

  private

  def self.layout
    {
      "a" => [nil, nil, nil, nil, nil],
      "b" => [nil, nil, nil, nil, nil],
      "c" => [nil, nil, nil, nil, nil],
      "d" => [nil, nil, nil, nil, nil]
    }
  end
end
