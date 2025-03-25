class SecretCode

  def generate_code
    @code = Array.new(4)
    @code = @code.map { |code| code = rand(10)}
    return @code
  end

end