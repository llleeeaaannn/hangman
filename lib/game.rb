require_relative 'word'
require_relative 'prompt'
require_relative 'serialize'

class Game
  include Prompt

  attr_reader :hangman, :dashes, :used

  def welcome
    welcome_prompt
  end

  def start
    @hangman = Word.new.word
    @hangman_clone = @hangman.dup
    @dashes = '_' * @hangman.length
    @used = String.new
    @turn = 1
    @won = false
    turn
  end

  def turn
    check_game_over
    turn_prompt(@turn)
    check_input
    result_prompt
    @turn += 1
    check_won
  end

  def check_input
    guess = gets.chomp.to_s.downcase
    if guess == 'save'
      print @current_game
      Serialize.new(@current_game, "text_one")
      print "Successssss"
    elsif
      guess.match?(/[A-Za-z]/) && @used.include?(guess)
      used_prompt(guess)
      turn
    elsif guess.match?(/[A-Za-z]/)
      guess.length > 1 ? check_word(guess) : check_letter(guess)
    else
      invalid_guess_prompt(guess)
      turn
    end
  end

  def check_word(guess)
    @hangman == guess ? @won = true : wrong_word_prompt(guess)
  end

  def check_letter(guess)
    @used += "#{guess} "
    while @hangman_clone.include?(guess)
      index = @hangman_clone.index(guess)
      @dashes[index] = guess
      @hangman_clone[index] = '_'
    end
    @dashes == @hangman ? @won = true : nil
  end

  def check_won
    if @won
      won_prompt
      play_again
    else
      turn
    end
  end

  def check_game_over
    if @turn > 10
      lost
      return
    end
  end

  def lost
    lost_prompt
    play_again
  end

  def play_again
    play_again_prompt
    gets.chomp.downcase == 'y' ? current_game = Game.new.start : thanks_prompt
  end
end
