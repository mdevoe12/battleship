require 'pry'

class StartGame

puts "Welcome to BATTLESHIP: The Next Generation"

  def start_sequence

    puts "My name is Commander Data, I'll be your guide during our battle with the Klingons"
    puts "Would you like to (p)lay, read the (i)instructions or (q)uit?"
    choice = gets.chomp

    if choice == "i" || choice == "instructions"
      puts "instructions" #insert code for printing instructions to screen
    elsif choice == "p" || choice == "play"
      puts "Engage!"
    elsif choice == "q" || choice == "quit"
      puts "Come back when you're ready to battle the Klingons."
    else
      puts "That's not a valid choice, please choose again."
      start_sequence
    end

  end

end


start_game = StartGame.new
start_game.start_sequence
