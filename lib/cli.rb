
class Cli
  def self.run
    # code  = CodeGenerator.new(level='beginner').code.sequence
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

  def assign_instructions(parts)
    if parts == 'p'
      puts "\n"
      puts "I have generated a beginner level sequence with four"
      puts "elements made up of: (r)ed, (b)lue, (g)reen, (y)ellow."
      puts "Use (q)uit at anytime to end the game."
      puts "What's your guess?"
    elsif parts == 'quit'
      outtro
    end


  end

  def execute_commands
    input = format_turn(gets.chomp)
    while (input.split("").length < 5) || commands != 'q'
      puts 'Please re-enter at least a four letter sequence, like "rgyy":  '
      input = format_turn(gets.chomp)
    end
    game.turn(guess)
  end

  def guess_es
    if game.num_of_guesses.length < 2
      "guess"
    else
      "guesses"
    end
  end

  def intro
    puts "\n"
    puts "Welcome to MASTERMIND"
    puts "Would you like to (p)lay, read the (i)instructions, or (q)uit?"
    puts "\n"
  end

  def start
    intro
    input = ""

    while input not= 'q'
      gets.chomp
      # parts = process_input(gets)
      # assign_instructions(parts)
    end

    puts "Congratulations! You guessed the sequence  in   over  seconds."
    puts "Do you want to (p)lay again or (q)uit?"
  end

  def outtro
    puts "Do you want to (p)lay again or (q)uit?"
  end

end
