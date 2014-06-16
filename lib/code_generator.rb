class CodeGenerator

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
    beginner = %w(r g b y).join
  end

  def advanced
    advanced = %w(roygbp).join
  end

  def expert
    expert   = %w(roygbpwb).join
  end

  





  # def code
  #   @code = Array.new
  #   .times do
  #     @code << @possible.shuffle.first
  #   end
  #   @code
  # end
end

generator = CodeGenerator.new("beginner")
p generator.level
