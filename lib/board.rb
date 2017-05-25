class Board

  attr_reader :board

  def initialize
    @board = {"a" => [nil, "", "", "", ""],
              "b" => [nil, "", "", "", ""],
              "c" => [nil, "", "", "", ""],
              "d" => [nil, "", "", "", ""]}
  end

end
