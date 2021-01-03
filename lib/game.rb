class Game
  def initialize
    @text = Text.new
  end

  def call
    puts text.game_intro
    name = gets.chomp
    puts text.welcome(name)
  end

  private

  attr_reader :text
end