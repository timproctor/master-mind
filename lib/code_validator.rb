# require './lib/guess'
# require './lib/code_generator'

class CodeValidator

  def checker(guess, code)
    guesser = guess.attempt.split("")
    codey   = code.sequence.split("")
    count = 0
    guesser.each do |letter1|
      codey.each do |letter2|
        if letter1 == letter2
          count += 1
          break
        end
      end
    end
    count
  end

  def checker_index(guess, code)
    guesser = guess.attempt.split("")
    codey   = code.sequence.split("")
    count = 0
    0.upto(guesser.length-1) do |index|
      if guesser[index] == codey[index]
        count += 1
      end
    end
    count
  end

end



# t = CodeValidator.new('rrrr', 'beginner')
# puts t.guess
# puts t.code
