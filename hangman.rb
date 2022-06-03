require_relative 'lib/word'
require_relative 'lib/game'
require_relative 'lib/prompt'

class Hangman
  attr_reader :current_game

  include Prompt

  def initialize
    @current_game = Game.new
    @current_game.welcome
    @current_game.start
  end
end

Hangman.new
