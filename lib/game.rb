class Game
  attr_accessor :num_of_guesses, :times
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

  def time_difference
    @times[-1] - @times[0]
  end

  def print_time
    secs  = time_difference.to_int
    mins  = secs / 60

    if mins > 0
      "#{mins} minutes and #{secs % 60} seconds"
    elsif secs > 0
      "#{secs} seconds"
    end
  end

end
