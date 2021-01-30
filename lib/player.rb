require './lib/board'

class Player

  attr_reader :previous_ship_placement,
              :board

  def initialize(layout:)
    @board = layout
    @previous_placement = ""
  end

  def call
    first_placement
    second_placement
    third_placement
    fourth_placement
    fifth_placement
  end

  def first_placement
    puts "Please choose your first boat placement"
    selection_one = gets.chomp.downcase
    x_first_placement(selection_one)
  end

  def x_first_placement(selection_one)
    if (selection_one[0].ord > 100) || (selection_one[0].ord < 97)
      p "Your selection is off the grid, please choose again."
      first_placement
      #call for recursive entry in player prompt file
    elsif (selection_one[1].to_i < 1) || (selection_one[1].to_i > 4)
      p "Your selection is off the grid, please choose again."
      first_placement
    else
      @board[selection_one[0]][selection_one[1].to_i] = "x1"
    end
  end

def second_placement
  puts "Please choose your second boat placement"
  selection_two = gets.chomp.downcase
  x_second_placement(selection_two)
end

  def x_second_placement(selection_two)
    previous_ship_placement("x1")
    if ((selection_two[0].ord > 100) || (selection_two[0].ord < 97))
      p "Your selection is off the grid, please choose again."
        second_placement
    elsif (selection_two[1].to_i < 1) || (selection_two[1].to_i > 4)
      p "Your selection is off the grid, please choose again."
    elsif @board[selection_two[0]][selection_two[1].to_i] != ""
        p "That place is already occupied, please select again."
        second_placement
        second_placement
    elsif selection_two[0] == @previous_placement[0]
        if @previous_placement[1].to_i - selection_two[1].to_i == -1
          @board[selection_two[0]][selection_two[1].to_i] = "x2"
        elsif @previous_placement[1].to_i - selection_two[1].to_i == 1
          @board[selection_two[0]][selection_two[1].to_i] = "x2"
        else
          p "That choice doesn't line up with your previous placement."
          second_placement
        end
    elsif selection_two[1] == @previous_placement[1]
      if @previous_placement[0].ord - selection_two[0].ord == -1
        @board[selection_two[0]][selection_two[1].to_i] = "x2"
      elsif @previous_placement[0].ord - selection_two[0].ord == 1
        @board[selection_two[0]][selection_two[1].to_i] = "x2"
      else
        p "That choice doesn't line up with your previous placement."
        second_placement
      end
    else
      p "That choice is not valid, please select again"
      second_placement
    end
  end

  def third_placement
    puts "Please choose the first place of your second boat."
    selection_three = gets.chomp.downcase
    y_first_placement(selection_three)
  end

  def y_first_placement(selection_three)
    if (selection_three[0].ord > 100) || (selection_three[0].ord < 97)
      p "Your selection is off the grid, please choose again."
      third_placement
      #call for recursive entry in player prompt file
    elsif (selection_three[1].to_i < 1) || (selection_three[1].to_i > 4)
      p "Your selection is off the grid, please choose again."
      third_placement
    elsif @board[selection_three[0]][selection_three[1].to_i] != ""
      p "That place is already occupied, please select again."
      third_placement
    else
      @board[selection_three[0]][selection_three[1].to_i] = "y1"
    end
  end


  def fourth_placement
    puts "Please choose the second place of your second boat."
    selection_four = gets.chomp.downcase
    y_second_placement(selection_four)
  end


  def y_second_placement(selection_four)
    if @board[selection_four[0]][selection_four[1].to_i] != ""
      p "That place is already occupied, please select again."
        fourth_placement
    elsif (selection_four[0].ord > 100) || (selection_four[0].ord < 97)
      p "Your selection is off the grid, please choose again."
        fourth_placement
    elsif (selection_four[1].to_i < 1) || (selection_four[1].to_i > 4)
      p "Your selection is off the grid, please choose again."
        fourth_placement
    elsif (selection_four[0] == previous_ship_placement("y1")[0])
        if previous_ship_placement("y1")[1].to_i - selection_four[1].to_i == -1
          @board[selection_four[0]][selection_four[1].to_i] = "y2"
        elsif previous_ship_placement("y1")[1].to_i - selection_four[1].to_i == 1
          @board[selection_four[0]][selection_four[1].to_i] = "y2"
        else
          p "That choice doesn't line up with your previous placement."
          fourth_placement
        end
    elsif (selection_four[1] == previous_ship_placement("y1")[1])
      if previous_ship_placement("y1")[0].ord - selection_four[0].ord == -1
        @board[selection_four[0]][selection_four[1].to_i] = "y2"
      elsif previous_ship_placement("y1")[0].ord - selection_four[0].ord == 1
        @board[selection_four[0]][selection_four[1].to_i] = "y2"
      else
        p "That choice doesn't line up with your previous placement."
        fourth_placement
      end
    else
        p "That choice isn't valid, please select again."
        fourth_placement
    end
  end

  def fifth_placement
    puts "Please choose the third place of your second boat."
    selection_five = gets.chomp.downcase
    y_third_placement(selection_five)
  end


  def y_third_placement(selection_five)
    if @board[selection_five[0]][selection_five[1].to_i] != ""
      p "That place is already occupied, please select again."
        fifth_placement
    elsif (selection_five[0].ord > 100) || (selection_five[0].ord < 97)
      p "Your selection is off the grid, please choose again."
        fifth_placement
    elsif (selection_five[1].to_i < 1) || (selection_five[1].to_i > 4)
      p "Your selection is off the grid, please choose again."
        fifth_placement
    elsif (selection_five[0] == previous_ship_placement("y2")[0]) &&
      ((previous_ship_placement("y1"))[0] == selection_five[0])
        if (previous_ship_placement("y2")[1].to_i - selection_five[1].to_i == -1)
          @board[selection_five[0]][selection_five[1].to_i] = "y3"
        elsif (previous_ship_placement("y2")[1].to_i - selection_five[1].to_i == 1)
          @board[selection_five[0]][selection_five[1].to_i] = "y3"
        else
          p "That choice doesn't line up with your previous placement."
          fifth_placement
        end
    elsif (selection_five[1] == previous_ship_placement("y2")[1]) &&
        ((previous_ship_placement("y1"))[1] == selection_five[1])
      if (previous_ship_placement("y2")[0].ord - selection_five[0].ord == -1)
              @board[selection_five[0]][selection_five[1].to_i] = "y3"
      elsif (previous_ship_placement("y2")[0].ord - selection_five[0].ord == 1)
              @board[selection_five[0]][selection_five[1].to_i] = "y3"
      else
          p "That choice doesn't line up with your previous placement."
          fifth_placement
      end
    else
        p "That's not a valid option."
        fifth_placement
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

end
