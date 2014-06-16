class CodeGenerator
  attr_reader :code

  def initialize(level)
    @level = level
  end

  def level
    if @level    == 'beginner'
      @level = beginner
    elsif @level == 'advanced'
      @level = advanced
    elsif @level == 'expert'
      @level = expert
    end
      @level
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
    @code = Array.new
    (@level.length).times do
      @code << @level.shuffle.first
    end
    @code.join
  end

end

# generator = CodeGenerator.new("expert")
# p generator.level
# p generator.code
