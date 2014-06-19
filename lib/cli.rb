require './lib/guess'
require './lib/code_generator'
require 'pry'

class Cli
  attr_reader :commands, :turn, :game

  def self.run
    game  = Game.new
    new(game).start
  end

  def initialize(game)
    @commands = ""
    validator = CodeValidator.new
    @turn     = ""
    @game     = game
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
    @turn = Guess.new(format_turn)
    until validator.full_match?(@turn, code)

      if @turn.attempt == 'q'
        break
      end

      matching_elements  = validator.checker(@turn, code)
      matching_positions = validator.checker_index(@turn, code)
        puts "\n\n\n"
        puts "\'#{@turn.attempt}\' has #{matching_elements} of the correct elements with"
        puts "#{matching_positions} in the correct positions."
        puts "\n\n\nYou've taken #{game.num_of_guesses} #{guess_es}."
      @turn = Guess.new(format_turn)
      game.turn(@turn)
    end

    if validator.full_match?(@turn, code)
      puts "Congratualations! You guessed the sequence \'#{code.sequence}\'!"
      puts "It took you #{game.num_of_guesses} #{guess_es} in over"
      puts "#{game.print_time}"
      outtro
    else
      puts "Maybe next time, you'll bring your A-game."
      outtro
    end
  end

  def process_input
    gets.strip.downcase
  end

  def proper_format?
    (@turn.length == 4) || (@turn[0] == 'q')
  end

  def format_turn
    @turn = gets.downcase.split("").select do |letter|
      letter =~ /[rgbyq]/
    end

    until proper_format?
      puts "\n\nRe-enter like, \'rrgr\' with exactly four characters: "
      puts "r for red, b for blue, g for green, or y for yellow."
      format_turn
    end

    @turn.join
  end

  def guess_es
    if game.num_of_guesses < 2
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

  def outtro
    puts "\n(p)lay or (q)uit? "
    @commands = process_input
      if @commands == 'p'
        Cli.run
      else
        puts "Have a great day not playing mastermind, if you can."
      end
  end

end
