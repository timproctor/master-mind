class Cli
  def self.run
    code  = CodeGenerator.level(level)
    guess = Guess.new(attempt)
    game  = Game.new
    new(game).start
  end

  attr_reader :commands, :turns, :game

  def initialize(game)
    @commands = ""
    @turns    = ""
    @game     = game
  end

  def process_input(input)
    input.strip.downcase
  end

  def format_turn(input)
    formated = process_input(input)
    formated.split("").select do |letter|
      letter =~ /[rgby]/
    end.join
  end

  def guess_es
    if game.num_of_guesses.length < 2
      "guess"
    else
      "guesses"
    end
  end

  def start
    puts "Welcome to MASTERMIND"
    puts "Would you like to (p)lay, read the (i)instructions, or (q)uit?"
    puts "\n"
    while
    end
    puts "Congratulations! You guessed the sequence #{code.sequence} in #{game.num_of_guesses.length} #{guess_es} over #{game.times.last - game.times.first} seconds."
    puts "Do you want to (p)lay again or (q)uit?"
  end

end
