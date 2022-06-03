class Word
  attr_reader :word

  def initialize
    @valid_words = File.readlines('words.txt').each { |line| line.gsub!("\n") }
    @valid_words.select! { |line| (line.length > 5 && line.length < 14) }
    @word = @valid_words.sample.downcase.chomp("\n")
  end
end
