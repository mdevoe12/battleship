require 'pry'

class Placement

  attr_reader :previous_ship_placement

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
    elsif selection_two[1].to_i > 4
      puts "not a valid selection please select again"
    elsif selection_two[0].ord > 100
      puts "not a valid selection, choice off grid plese select again"
    elsif selection_two[0] == @previous_placement[0] #horizontal  placement
        if @previous_placement[1].to_i - selection_two[1].to_i == -1
          @board[selection_two[0]][selection_two[1].to_i] = "s2"
        elsif @previous_placement[1].to_i - selection_two[1].to_i == 1
          @board[selection_two[0]][selection_two[1].to_i] = "s2"
        else
          puts "not a valid selection, please select again"
        end
    else selection_two[1] == @previous_placement[1] #vertical placement
      if @previous_placement[0].ord - selection_two[0].ord == -1
        @board[selection_two[0]][selection_two[1].to_i] = "s2"
      elsif @previous_placement[0].ord - selection_two[0].ord == 1
        @board[selection_two[0]][selection_two[1].to_i] = "s2"
      else
        puts "not a valid selection, please select again"
      end
    end
  end


  def b_first_placement(selection_three)
    if @board[selection_three[0]][selection_three[1].to_i] == ""
      # if north(selection_three) == true || west(selection_three) == true || south(selection_three) == true || east(selection_three) == true
        @board[selection_three[0]][selection_three[1].to_i] = "b1"
      # end
    end
  end

  def north(input)
    potential_two = input[0].ord - 1
    potential_two = potential_two.chr + input[1]
    potential_three = input[0].ord - 2
    potential_three = potential_three.chr + input[1]

    if (potential_two[0].ord < 97) || (potential_three[0].ord < 97)
      north = false
    elsif (@board[potential_two[0]][potential_two[1].to_i] == "") && (@board[potential_three[0]][potential_three[1].to_i] == "")
      north = true
    else
      north = false
    end
   north
  end

  def south(input)
    potential_two = input[0].ord + 1
    potential_two = potential_two.chr + input[1]
    potential_three = input[0].ord + 2
    potential_three = potential_three.chr + input[1]

    # binding.pry
    if (potential_two[0].ord > 100) || (potential_three[0].ord > 100)
      south = false
    elsif (@board[potential_two[0]][potential_two[1].to_i] == "") && (@board[potential_three[0]][potential_three[1].to_i] == "")
      south = true
    else
      south = false
    end
   south
  end

  def east(input)
    potential_two = input[0] + (input[1].to_i + 1).to_s
    potential_three = input[0] + (input[1].to_i + 2).to_s

    if (@board[potential_two[0]][potential_two[1].to_i] == "") && (@board[potential_three[0]][potential_three[1].to_i] == "")
      east = true
    else
      east = false
    end
   east
  end

  def west(input)
    potential_two = input[0] + (input[1].to_i - 1).to_s
    potential_three = input[0] + (input[1].to_i - 2).to_s

    if (@board[potential_two[0]][potential_two[1].to_i] == "") && (@board[potential_three[0]][potential_three[1].to_i] == "")
      west = true
    else
      west = false
    end
   west
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
