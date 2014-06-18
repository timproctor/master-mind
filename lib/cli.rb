require './lib/guess'
require './lib/code_generator'
require 'pry'


class Cli
  def self.run
    # code  = CodeGenerator.new(level='beginner').code.sequence
    game  = Game.new
    new(game).start
  end

  attr_reader :commands, :turns, :game


  def initialize(game)
    @commands = ""
    # @code     = code.sequence
    validator = CodeValidator.new
    @turns    = ""
    @game     = game
  end

  def process_input
    gets.strip.downcase
  end

  def format_turn
    gets.formatted.split("").select do |letter|
      letter =~ /[rgby]/
    end.join
  end

  def assign_instructions(parts)
    if parts   == 'p'
      puts "\n"
      puts "I have generated a beginner level sequence with four"
      puts "elements made up of: (r)ed, (b)lue, (g)reen, (y)ellow."
      puts "Use (q)uit at anytime to end the game."
      puts "\nI'll get the game...\n"
    else parts == 'i'
      puts "\n"
      puts 'A four character code has been stored, like "rbyb", and after'
      puts 'your guess, the computer will let you know how close you are.'
      puts 'The game ends when you correctly input the secret code.'
      puts "\n"
      puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
    end
  end

  def execute_game
    code      = CodeGenerator.new("beginner").code
    validator = CodeValidator.new
    puts "\nWhat is your guess?"
    guess = Guess.new(gets.chomp)
    until validator.full_match?(guess, code)
      matching_elements  = validator.checker(guess, code)
      matching_positions = validator.checker_index(guess, code)
      puts "You got #{matching_elements} matches in #{matching_positions} positions."
      guess = Guess.new(gets.chomp)
    end
    puts "Congratualations, you win!"
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
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    puts "\n"
  end

  def start
    intro

    while commands != 'q'
      @commands = process_input
      assign_instructions(@commands)
        if @commands == 'p'
          execute_game
        end
    end

    outtro
  end

  def outtro
    puts "\nDo you want to (p)lay again or (q)uit? "
    @commands = process_input
      if @commands == 'p'
        Cli.run
      else
        puts "Have a great day not playing mastermind, if you can."
      end
  end

end
