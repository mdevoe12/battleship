require 'pry'
require './lib/computer_placement'
require './lib/player_placement'

class Game

  def initialize
    @shot_counter = 0

  end

puts "Welcome to BATTLESHIP: The Next Generation"

  def start_sequence

    puts "My name is Commander Data, I'll be your guide during our battle with the Klingons"
    puts "Would you like to (p)lay, read the (i)instructions or (q)uit?"
    choice = gets.chomp

    if choice == "i" || choice == "instructions"
      instructions
    elsif choice == "p" || choice == "play"
      play
    elsif choice == "q" || choice == "quit"
      puts "Come back when you're ready to battle the Klingons."
      end_game
    else
      puts "That's not a valid choice, please choose again."
      start_sequence
    end

  end

  def instructions
    puts "instructions" #insert code for printing instructions to screen
    start_sequence
  end

  def play
    puts "Engage!"
    @computer_player = ComputerPlacement.new
    @human_player = PlayerPlacement.new
    request_shot
  end

  def request_shot
    puts "please enter your shot coordinates"
    shot = gets.chomp
    player_check(shot)
  end

  def player_check(shot)
    if ((shot[0].ord > 100) || (shot[0].ord < 97))
      p "Your selection is off the grid, please choose again."
      request_shot
    elsif (shot[1].to_i < 1) || (shot[1].to_i > 4)
      p "Your selection is off the grid, please choose again."
      request_shot
    elsif @computer_player.board[shot[0]][shot[1].to_i] == ""
       @computer_player.board[shot[0]][shot[1].to_i] = "M"
       puts "Your photon torpedo missed!"
       @shot_counter += 1
    elsif (@computer_player.board[shot[0]][shot[1].to_i].include?("x")) ||
      (@computer_player.board[shot[0]][shot[1].to_i].include?("y"))
        @computer_player.board[shot[0]][shot[1].to_i] = "H"
      puts "It's a hit!"
      @shot_counter += 1
    else
      puts "Not a valid selection, please choose again."
      request_shot
    end
    ship_status(@computer_player)
    # print board
    puts "The Klingons are shooting! Brace for impact!!!"
    puts ""

    display_board
    computer_shot
  end

  def computer_shot
    shot = random_num
    computer_check(shot)
  end

  def computer_check(shot)
    if @human_player.board[shot[0]][shot[1].to_i] == ""
       @human_player.board[shot[0]][shot[1].to_i] = "M"
       puts "The Klingons missed your fleet!"
    elsif (@human_player.board[shot[0]][shot[1].to_i].include?("x")) ||
      (@human_player.board[shot[0]][shot[1].to_i].include?("y"))
        @human_player.board[shot[0]][shot[1].to_i] = "H"
      puts "Warning: Klingons hit one of your ships!"
    else
      puts "Not a valid selection, please choose again."
        computer_shot
    end
    ship_status(@human_player)
    # print board
    puts "It's time to return fire, prep photon torpedos!"
    puts @human_player.board
    request_shot
  end


  def ship_status(player)
    x_count = 0
    y_count = 0
    player.board.each do |key, row|
      row.each do |index|
      if (index == "x1") || (index == "x2")
          x_count += 1
      elsif (index == "y1") || (index == "y2") || (index == "y3")
          y_count += 1
        end
      end
    end
    if (player = @computer_player) && ((x_count == 0) && (y_count == 0))
      puts "====================================="
      puts "You've destoryed the Klingon's Fleet!"
      puts "V-I-C-T-O-R-Y"
      puts "====================================="
      end_game
    elsif (player = @human_player) && ((x_count == 0) && (y_count == 0))
      puts "====================================="
      puts "The KLINGONS have destroyed your Fleet"
      puts "D-E-F-E-A-T"
      puts "====================================="
      end_game
    elsif x_count == 0
      puts "You've destroyed a Size 2 Ship"
    elsif y_count == 0
      puts "You've destoryed a Size 3 Ship"
    end
  end

  def end_game
    puts
    puts "Thanks for playing BATTLESHIP: The Next Generation"
    puts
    exit
  end

  def random_num
    random_number = ""
    num_gen = (1..4)
    letter_gen = ["a", "b", "c", "d"]
    random_number = letter_gen.sample + rand(num_gen).to_s
  end

  def display_board
    row_a = "A" + @computer_player.board["a"].join("     ")
    row_a = row_a.gsub(/[xy123 ]/, " ")
    row_b = "B" + @computer_player.board["b"].join("     ")
    row_b = row_b.gsub(/[xy123 ]/, " ")
    row_c = "C" + @computer_player.board["c"].join("     ")
    row_c = row_c.gsub(/[xy123 ]/, " ")
    row_d = "D" + @computer_player.board["d"].join("     ")
    row_d = row_d.gsub(/[xy123 ]/, " ")
    puts "============================="
    puts ".     1     2     3     4"
    puts
    puts row_a
    puts
    puts row_b
    puts
    puts row_c
    puts
    puts row_d
    puts "============================="
  end

end


start_game = Game.new
start_game.start_sequence
