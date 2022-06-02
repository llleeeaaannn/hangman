require_relative 'lib/word'
require_relative 'lib/game'
require_relative 'lib/prompt'

include Prompt

class Hangman

  def initialize
    welcome_prompt()
    Game.new.start
  end

end

Hangman.new
