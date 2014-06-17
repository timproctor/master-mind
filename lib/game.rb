class Game
  attr_reader :num_of_guesses, :times

  def initialize
    @num_of_guesses = 0
    @holds_guess    = Array.new
    @times          = Array.new
  end

  def turn(guess)
    @holds_guess << guess
    @num_of_guesses += @holds_guess.length
    clock
  end

  def history
    @holds_guess
  end

  def clock
    t = Time.new
    @times << t
    @times
  end

end
