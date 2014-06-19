class Game
  attr_reader :num_of_guesses, :times

  def initialize
    @num_of_guesses = 1
    @holds_guess    = Array.new
    @times          = Array.new
  end

  def turn(guess)
    @holds_guess << guess
    @num_of_guesses += 1
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

  def print_time(time_difference)
    days = hours = mins = 0
      mins = (seconds / 60).to_i
      seconds = (seconds % 60 ).to_i
      hours = (mins / 60).to_i
      mins = (mins % 60).to_i
      days = (hours / 24).to_i
      hours = (hours % 24).to_i
  end

end
