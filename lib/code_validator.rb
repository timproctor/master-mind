require './lib/guess'
require './lib/code_generator'
require './lib/game'

class CodeValidator

  def checker(guess, code)
    guess = guess.attempt.split("")
    code  = code.sequence.split("")
    count = 0
    guess.length.times do |index1|
      code.length.times do |index2|
        if guess[index1] == code[index2]
          count += 1
          code[index2] = ""
          break
        end
      end
    end
    count
  end

  def checker_index(guess, code)
    guess = guess.attempt.split("")
    code  = code.sequence.split("")
    count = 0
    0.upto(guess.length-1) do |index|
      if guess[index] == code[index]
        count += 1
      end
    end
    count
  end

  def full_match?(guess, code)
    guess.attempt == code.sequence
  end


end



# t = CodeValidator.new
# puts t.self.checker('rrrr', code.sequence)
