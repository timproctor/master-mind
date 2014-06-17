class Cli
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

  def start
    puts "Welcome to MASTERMIND
Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end
end
