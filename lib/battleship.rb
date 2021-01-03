require './lib/computer'
require './lib/player'
require './lib/output'
require './lib/game'

class Battleship
  def initialize
    @output = Output.new
    @game = Game
  end

  def self.call
    new.call
  end

  def call
    output.call('game_intro')
    output.call('user_input')
    start_sequence
  end

  private

  attr_reader :output, :game

  def user_input
    gets.chomp
  end

  def start_sequence
    output.call('options')

    choice = gets.chomp.downcase
    case choice
    when 'i' then instructions
    when 'p' then play
    when 'q' then quit
    else
      puts "That's not a valid choice, please choose again."
      start sequence
    end
  end

  def instructions
    output.call('instructions_text')
    start_sequence
  end

  def quit
    puts `clear`
    puts
    puts "Come back when you're ready to battle the Klingons."
    end_game
  end

  def play
    game.new.call
  end

  def end_game
    puts "
      Thanks for playing BATTLESHIP: The Next Generation
    "
    exit
  end
end

Battleship.call
