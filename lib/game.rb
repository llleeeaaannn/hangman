require_relative 'word'
require_relative 'prompt'

class Game

  include Prompt

  attr_reader :hangman, :dashes, :used

  def welcome
    welcome_prompt
  end

  def start
    @hangman = Word.new.word
    @hangman_clone = @hangman.dup
    @dashes = "_" * @hangman.length
    @used = " "
    @turn = 1
    @won = false
    print @hangman
    turn
  end

  def turn
    turn_prompt(@turn)
    guess = gets.chomp.to_s.downcase
    if guess.match?(/[A-Za-z]/) && @used.include?(guess)
      used_prompt(guess)
      turn
    elsif guess.match?(/[A-Za-z]/)
      guess.length > 1 ? check_word(guess) : check_letter(guess)
    else
      invalid_guess_prompt(guess)
      turn
    end
    @turn += 1
    @turn > 10 ? lost() : check_won()
  end

  def check_word(guess)
    @hangman == guess ? @won = true : wrong_word_prompt(guess)
  end

  def check_letter(guess)
    @used += guess + " "
    while @hangman_clone.include?(guess)
      index = @hangman_clone.index(guess)
      @dashes[index] = guess
      @hangman_clone[index] = "_"
    end
    if @dashes == @hangman
      @won = true
    end
  end

  def check_won
    if @won && @turn <= 10
      won_prompt()
      play_again()
    else
      result_prompt()
      turn()
    end
  end

  def lost()
    lost_prompt()
    play_again()
  end

  def play_again
    play_again_prompt
    gets.chomp.downcase == "y" ? Game.new.start : thanks_prompt()
  end

end
