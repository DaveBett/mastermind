require_relative 'secret_code'
require 'colorize'
require 'pry-byebug'

class Guess

  def initialize
    @arr = []
    @code = SecretCode.new
    @comp_select = @code.generate_code
    @full_right = 0
    @almost_right = 0
    @win = false
  end

  def play_round

    @full_right = 0
    @almost_right = 0

    self.get_new_input

    @arr.each do |number|
      @comp_select.each do |figure|
        if number == figure
          @almost_right += 1
          break
        end
      end
    end

    for i in 0...4
      if @arr[i] == @comp_select[i]
        @full_right += 1
        @almost_right -= 1
      end
    end
    self.give_result
    return @arr
  end

  private

  def give_result

    puts "Round #{@round}: your guess was #{@arr}"
    puts "you got #{@full_right} right figures in the right place".colorize(:green)
    puts "you got #{@almost_right} right figures in the wrong place".colorize(:yellow)
    puts "you got #{4 - @full_right - @almost_right} wrong figures".colorize(:red)

  end

  def get_new_input

    puts 'Insert your code (4 figures): '
    @input = gets.chomp.to_s
    @arr = @input.split('')

    @arr.pop while @arr.length > 4

    @arr = @arr.map { |number| number.to_i }
    @arr.compact

  end
end
