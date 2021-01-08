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
    output.game_intro
    output.welcome(user_input)

    start_sequence
  end

  private

  attr_reader :output, :game

  def user_input
    gets.chomp
  end

  def start_sequence
    output.options

    choice = user_input.downcase
    case choice
    when 'i' then instructions
    when 'p' then play
    when 'q' then quit
    else
      output.invalid_choice
      start_sequence
    end
  end

  def instructions
    output.instructions_text
    start_sequence
  end

  def quit
    output.quit
    end_game
  end

  def play
    game.new.call
  end

  def end_game
    output.end_game
    exit
  end
end

Battleship.call
