# frozen_string_literal: true

class SecretCode

  def generate_code
    @code = Array.new(4)
    @code = @code.map { |_code| rand(10) }
    @code
  end
  
end