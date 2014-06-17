require './lib/code'

class CodeGenerator
  attr_reader :level, :sequence

  def initialize(level)
    @level = level
    if @level == 'beginner'
      @level = beginner
    elsif @level == 'advanced'
      @level = advanced
    else @level == 'expert'
      @level = expert
    end
  end

  def beginner
    beginner = %w(r g b y)
  end

  def advanced
    advanced = %w(r o y g b p)
  end

  def expert
    expert   = %w(r o y g b p w b)
  end

  def code
    code = Array.new
    (@level.length).times do
      code << @level.shuffle.first
    end
    Code.new(code.join)
  end

end

generator = CodeGenerator.new("beginner")
# puts generator.level
puts generator.code.sequence
