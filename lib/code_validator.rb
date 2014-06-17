require './lib/guess'
require './lib/code_generator'


class CodeValidator

  def checker(guess, code)
    guess = guess.attempt.split("")
    code  = code.sequence.split("")

    guess.select do |letter|
      code.include?(letter)
    end.length
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
