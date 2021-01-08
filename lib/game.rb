require './lib/game'
require './lib/player'
require './lib/computer'

class Game
  def initialize(output: Output.new)
    @shot_counter = 0
    @start_time = Time.now
    @computer_player = Computer.new
    @human_player = Player.new
    @output = output
  end

  def call
    output.engage
    computer_player.run
    human_player.run
    request_shot
  end

  private

  attr_reader :computer_player, :human_player, :output

  def request_shot
    output.shot_request
    shot = gets.chomp.downcase
    output.clear
    player_check(shot)
  end

  def player_check(shot)
    if (shot[0].ord > 100) || (shot[0].ord < 97)
      output.shot_request_off_grid
      request_shot
    elsif (shot[1].to_i < 1) || (shot[1].to_i > 4)
      output.shot_request_off_grid
      request_shot
    elsif @computer_player.board[shot[0]][shot[1].to_i] == ''
      @computer_player.board[shot[0]][shot[1].to_i] = 'M'
      output.shot_missed
      @shot_counter += 1
    elsif (@computer_player.board[shot[0]][shot[1].to_i].include?("x")) ||
          (@computer_player.board[shot[0]][shot[1].to_i].include?("y"))
      @computer_player.board[shot[0]][shot[1].to_i] = 'H'
      output.shot_hit
      @shot_counter += 1
    else
      output.invalid_choice
      request_shot
    end

    ship_status(@computer_player)
    output.shot_incoming
    display_board
    computer_shot
  end

  def computer_shot
    shot = random_num
    computer_check(shot)
  end

  def computer_check(shot)
    if    @human_player.board[shot[0]][shot[1].to_i] == ""
          @human_player.board[shot[0]][shot[1].to_i] = "M"
          puts
          puts "The Klingons missed your fleet!"
          puts
    elsif (@human_player.board[shot[0]][shot[1].to_i].include?("x")) ||
          (@human_player.board[shot[0]][shot[1].to_i].include?("y"))
           @human_player.board[shot[0]][shot[1].to_i] = "H"
          puts
          puts "Warning: Klingons hit one of your ships!"
          puts
    else
          puts
          puts "Not a valid selection, please choose again."
          puts
          computer_shot
    end
    ship_status(@human_player)
    puts
    puts "It's time to return fire, prep photon torpedos!"
    puts
    request_shot
  end

  def ship_status(player)
    x_count = 0
    y_count = 0
    player.board.each do |key, row|
      row.each do |index|
      if    (index == "x1") || (index == "x2")
            x_count += 1
      elsif (index == "y1") || (index == "y2") || (index == "y3")
            y_count += 1
        end
      end
    end
    if (player = @computer_player) && ((x_count == 0) && (y_count == 0))
      @end_time = Time.now
      game_time
      puts "================================================================="
      puts "                       V-I-C-T-O-R-Y"
      puts
      puts "You destroyed the Klingon's Fleet with #{@shot_counter} torpedoes"
      puts "It took you #{@game_time} seconds to complete your mission."
      puts "================================================================="
      end_game
    elsif (player = @human_player) && ((x_count == 0) && (y_count == 0))
      @end_time = Time.now
      game_time
      puts "========================================"
      puts "The KLINGONS have destroyed your Fleet"
      puts "           D-E-F-E-A-T"
      puts "It took #{@game_time} seconds for defeat"
      puts "========================================"
      end_game
    elsif x_count == 0
      puts
      puts "You've destroyed a Size 2 Ship"
      puts
    elsif y_count == 0
      puts
      puts "You've destoryed a Size 3 Ship"
      puts
    end
  end

  def game_time
    @game_time = @end_time - @start_time
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
