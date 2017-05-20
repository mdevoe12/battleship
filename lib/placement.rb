require 'pry'

class Placement

  def initialize
    @board = {"a" => [nil, "", "", "", ""],
              "b" => [nil, "", "", "", ""],
              "c" => [nil, "", "", "", ""],
              "d" => [nil, "", "", "", ""]}

  end


  def first_placement(selection)
    if selection[1] == "0"
      puts "not a valid selection, please select again"
      #call back to choice of spot or redirec to selection screen
    else
      @board[selection[0]][selection[1].to_i] = "s2"
    end
    @board[selection[0]][selection[1].to_i]
  end

  def second_placement(selection)
    if selection[1] == "0"
      puts "not a valid selection, please select again"
      #call back to choice of spot or redirect to selection screen
    elsif selection[1].to_i == @board["a"].index("s2")
      @board[selection[0]][selection[1].to_i] = "s2"
      binding.pry
    end
  end

end
