module Prompt

  def test_prompt
    puts "THIS WAS PRINTED"
  end

  def overrr
    puts "TURN OVER 10"
  end

  def welcome_prompt
    puts "Welcome to Hangman!\n" +
    "The rules of Hangman are simple:\n" +
    "The computer will select a random word between 5 and 12 letters long. You have 10 turns and during each turn you must guess a letter.\n" +
    "If the letter you guess is in the word, the computer will display each instance of the letter. If it's not, the computer will mark it as used.\n" +
    "If you think you know the word, you can use one of your 10 turns to guess the word.\n" +
    "If you have not guessed the word or found every letter in the word by the end of your 10 turns, you lose."
  end

  def turn_prompt(turn)
    puts "Turn #{turn}. Please enter a letter (or a word if you think you know the answer):"
  end

  def invalid_guess_prompt(guess)
    puts "#{guess} is not a letter or word, please try again!"
  end

  def used_prompt(guess)
    puts "Sorry, you've already used the letter #{guess}. Try again!"
  end

  def wrong_word_prompt(guess)
    puts "Unfortunately the word is not #{guess}"
  end

  def won_prompt
    puts "Congratultions! Your guess was correct, the word is #{hangman}."
  end

  def lost_prompt
    puts "Unfortunately you lost! You ran out of turns. The answer was: #{hangman}."
  end

  def result_prompt
    puts "Hangman:  #{dashes}   Used letters: #{used}"
  end

  def play_again_prompt
    puts "Would you like to play again? Press 'y' for Yes or any other key for No."
  end

  def thanks_prompt
    puts "Thank you for playing. Bye!"
  end

end
