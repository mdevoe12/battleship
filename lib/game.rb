class Game
  def initialize
    @text = Text.new
  end

  def call
    text.game_intro
    text.welcome(user_input)
    start_sequence
  end

  private

  def user_input
    gets.chomp
  end

  def start_sequence
    text.options

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
    text.instructions_text
    start_sequence
  end

  attr_reader :text
end