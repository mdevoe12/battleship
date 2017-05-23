require 'pry'

class ComputerPlacement

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
      @board[selection_one[0]][selection_one[1].to_i] = "x1"
    end
    @board[selection_one[0]][selection_one[1].to_i]
  end


  def second_placement(selection_two)
    previous_ship_placement("x1")
    if @board[selection_two[0]][selection_two[1].to_i] != ""
        second_placement(random_num)
    elsif selection_two[0] == @previous_placement[0] #horizontal  placement
        if @previous_placement[1].to_i - selection_two[1].to_i == -1
          @board[selection_two[0]][selection_two[1].to_i] = "x2"
        elsif @previous_placement[1].to_i - selection_two[1].to_i == 1
          @board[selection_two[0]][selection_two[1].to_i] = "x2"
        end
    elsif selection_two[1] == @previous_placement[1] #vertical placement
      if @previous_placement[0].ord - selection_two[0].ord == -1
        @board[selection_two[0]][selection_two[1].to_i] = "x2"
      elsif @previous_placement[0].ord - selection_two[0].ord == 1
        @board[selection_two[0]][selection_two[1].to_i] = "x2"
      end
    else
      second_placement(random_num)
    end
  end


  def b_first_placement(selection_three)
    if @board[selection_three[0]][selection_three[1].to_i] == ""
        @board[selection_three[0]][selection_three[1].to_i] = "y1"
    else
        puts "invalid selection, your battleship won't work here, please try again."
    end
  end


  def b_second_placement(selection_four)
    # previous_ship_placement("y1")
    if selection_four[1] == "0" || selection_four[1].to_i > 4
      puts "not a valid selection, please select again"
    elsif selection_four[0].ord > 100
      puts "not a valid selection, choice off grid plese select again"
    elsif @board[selection_four[0]][selection_four[1].to_i] != ""
      puts "not a valid selection, space occupied"
    elsif (selection_four[0] == previous_ship_placement("y1")[0])

           #horizontal  placement
        if previous_ship_placement("y1")[1].to_i - selection_four[1].to_i == -1
          @board[selection_four[0]][selection_four[1].to_i] = "y2"
        elsif previous_ship_placement("y1")[1].to_i - selection_four[1].to_i == 1
          @board[selection_four[0]][selection_four[1].to_i] = "y2"
        else
          puts "not a valid selection, please select again"
        end
    else (selection_four[1] == previous_ship_placement("y1")[1])
        #vertical placement
      if previous_ship_placement("y1")[0].ord - selection_four[0].ord == -1
        @board[selection_four[0]][selection_four[1].to_i] = "y2"
      elsif previous_ship_placement("y1")[0].ord - selection_four[0].ord == 1
        @board[selection_four[0]][selection_four[1].to_i] = "y2"
      else
        puts "not a valid selection, please select again"
      end
    end
  end


  def b_third_placement(selection_five)
    previous_ship_placement("y2")
    if selection_five[1] == "0" || selection_five[1].to_i > 4
      puts "not a valid selection, please select again"
    elsif selection_five[0].ord > 100
      puts "not a valid selection, choice off grid plese select again"
    elsif @board[selection_five[0]][selection_five[1].to_i] != ""
      puts "not a valid selection, space occupied"
      #horizontal  placement
    elsif (selection_five[0] == previous_ship_placement("y2")[0]) &&
      ((previous_ship_placement("y1"))[0] == selection_five[0])
        if (previous_ship_placement("y2")[1].to_i - selection_five[1].to_i == -1)
          @board[selection_five[0]][selection_five[1].to_i] = "y3"

        elsif (previous_ship_placement("y2")[1].to_i - selection_five[1].to_i == 1)
          @board[selection_five[0]][selection_five[1].to_i] = "y3"
        else
          puts "not a valid selection, please select again"
        end
        #vertical placement
    elsif (selection_five[1] == previous_ship_placement("y2")[1]) &&
        ((previous_ship_placement("y1"))[1] == selection_five[1])
        # binding.pry
      if (previous_ship_placement("y2")[0].ord - selection_five[0].ord == -1)
              @board[selection_five[0]][selection_five[1].to_i] = "y3"
      elsif (previous_ship_placement("y2")[0].ord - selection_five[0].ord == 1)
              @board[selection_five[0]][selection_five[1].to_i] = "y3"
      else
        puts "not a valid selection, please select again"
      end
    end
  end


  def previous_ship_placement(input)
    @board.each do |key, row|
      row.find do |index|
        if index == input
          @previous_placement = key + row.index(index).to_s
        end
      end
    end
    @previous_placement
  end

  def random_num
    random_number = ""
    num_gen = (1..4)
    letter_gen = ["a", "b", "c", "d"]
    random_number = letter_gen.sample + rand(num_gen).to_s
  end

end
