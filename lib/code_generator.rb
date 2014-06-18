require './lib/code'

class CodeGenerator
  attr_reader :level, :sequence, :length

  def initialize(level='beginner')
    @length = length
    @level = level
    if @level == 'beginner'
      @level = beginner
      @length = 4
    elsif @level == 'advanced'
      @level = advanced
      @length = 6
    else @level == 'expert'
      @level = expert
      @length = 8
    end
  end

  def code
    code = Array.new
    (@length).times do
      code << @level.shuffle.first
    end
    Code.new(code.join)
  end

  private

  def beginner
    beginner = %w(r g b y)
  end

  def advanced
    advanced = %w(r o y g b )
  end

  def expert
    expert   = %w(r o y g b p)
  end
end

generator = CodeGenerator.new("beginner")
# puts generator.level
# puts generator.code.sequence
