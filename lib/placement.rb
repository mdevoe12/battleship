require 'pry'

class Placement

  attr_reader :place, :previous_ship_placement

  def initialize
    @board = {"a" => [nil, "", "", "", ""],
              "b" => [nil, "", "", "", ""],
              "c" => [nil, "", "", "", ""],
              "d" => [nil, "", "", "", ""]}
    @previous_placement = ""

  end


  def first_placement(selection_one)
    if selection_one[1] == "0"
      puts "not a valid selection, please select again"
      #call back to choice of spot or redirec to selection screen
    else
      @board[selection_one[0]][selection_one[1].to_i] = "s1"
    end
    @board[selection_one[0]][selection_one[1].to_i]
  end




  def second_placement(selection_two)
    previous_ship_placement
    if selection_two[1] == "0"
      puts "not a valid selection, please select again"
      #call back to choice of spot or redirect to selection screen
    elsif selection_two[0] == @previous_placement[0]
      @board[selection_two[0]][selection_two[1].to_i] = "s2"
    else selection_two[1] == @previous_placement[1] #vertical placement
      @board[selection_two[0]][selection_two[1].to_i] = "s2"
    end
  end





  def previous_ship_placement
    @board.each do |key, row|
      row.find do |index|
        if index == "s1"
          @previous_placement = key + row.index(index).to_s
        end
      end
    end
    @previous_placement
  end

end
