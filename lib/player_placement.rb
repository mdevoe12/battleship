require 'pry'

class PlayerPlacement

  attr_reader :previous_ship_placement

  def initialize
    @board = {"a" => [nil, "", "", "", ""],
              "b" => [nil, "", "", "", ""],
              "c" => [nil, "", "", "", ""],
              "d" => [nil, "", "", "", ""]}
    @previous_placement = ""
  end

  def x_first_placement(selection_one)
    
      @board[selection_one[0]][selection_one[1].to_i] = "x1"
  end


  def x_second_placement(selection_two)
    previous_ship_placement("x1")
    if @board[selection_two[0]][selection_two[1].to_i] != ""
        x_second_placement(random_num)
    elsif selection_two[0] == @previous_placement[0]
        if @previous_placement[1].to_i - selection_two[1].to_i == -1
          @board[selection_two[0]][selection_two[1].to_i] = "x2"
        elsif @previous_placement[1].to_i - selection_two[1].to_i == 1
          @board[selection_two[0]][selection_two[1].to_i] = "x2"
        else
          x_second_placement(random_num)
        end
    elsif selection_two[1] == @previous_placement[1]
      if @previous_placement[0].ord - selection_two[0].ord == -1
        @board[selection_two[0]][selection_two[1].to_i] = "x2"
      elsif @previous_placement[0].ord - selection_two[0].ord == 1
        @board[selection_two[0]][selection_two[1].to_i] = "x2"
      else
        x_second_placement(random_num)
      end
    else
      x_second_placement(random_num)
    end
  end


  def y_first_placement(selection_three)
    if @board[selection_three[0]][selection_three[1].to_i] == ""
        @board[selection_three[0]][selection_three[1].to_i] = "y1"
    else
        y_first_placement(random_num)
    end
  end


  def y_second_placement(selection_four)
    if @board[selection_four[0]][selection_four[1].to_i] != ""
      y_second_placement(random_num)
    elsif (selection_four[0] == previous_ship_placement("y1")[0])
        if previous_ship_placement("y1")[1].to_i - selection_four[1].to_i == -1
          @board[selection_four[0]][selection_four[1].to_i] = "y2"
        elsif previous_ship_placement("y1")[1].to_i - selection_four[1].to_i == 1
          @board[selection_four[0]][selection_four[1].to_i] = "y2"
        else
          y_second_placement(random_num)
        end
    elsif (selection_four[1] == previous_ship_placement("y1")[1])
      if previous_ship_placement("y1")[0].ord - selection_four[0].ord == -1
        @board[selection_four[0]][selection_four[1].to_i] = "y2"
      elsif previous_ship_placement("y1")[0].ord - selection_four[0].ord == 1
        @board[selection_four[0]][selection_four[1].to_i] = "y2"
      else
        y_second_placement(random_num)
      end
    else
        y_second_placement(random_num)
    end
  end


  def y_third_placement(selection_five)
    if @board[selection_five[0]][selection_five[1].to_i] != ""
      y_third_placement(random_num)
    elsif (selection_five[0] == previous_ship_placement("y2")[0]) &&
      ((previous_ship_placement("y1"))[0] == selection_five[0])
        if (previous_ship_placement("y2")[1].to_i - selection_five[1].to_i == -1)
          @board[selection_five[0]][selection_five[1].to_i] = "y3"
        elsif (previous_ship_placement("y2")[1].to_i - selection_five[1].to_i == 1)
          @board[selection_five[0]][selection_five[1].to_i] = "y3"
        else
          y_third_placement(random_num)
        end
    elsif (selection_five[1] == previous_ship_placement("y2")[1]) &&
        ((previous_ship_placement("y1"))[1] == selection_five[1])
      if (previous_ship_placement("y2")[0].ord - selection_five[0].ord == -1)
              @board[selection_five[0]][selection_five[1].to_i] = "y3"
      elsif (previous_ship_placement("y2")[0].ord - selection_five[0].ord == 1)
              @board[selection_five[0]][selection_five[1].to_i] = "y3"
      else
          y_third_placement(random_num)
      end
    else
        y_third_placement(random_num)
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
