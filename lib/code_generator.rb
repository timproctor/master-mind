require './lib/code'

class CodeGenerator
  attr_reader :level, :sequence, :length

  def initialize(level='beginner')
    @length = 4
    @level = beginner
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
    %w(r g b y)
  end

  def advanced
    %w(r o y g b )
  end

  def expert
    %w(r o y g b p)
  end
end

# generator = CodeGenerator.new("beginner")
# puts generator.level
# puts generator.code.sequence
