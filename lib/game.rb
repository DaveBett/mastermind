require_relative 'guess.rb'
require 'pry-byebug'

class Game
    
  def initialize
    @secret_code = SecretCode.new
    @comp_select = @secret_code.generate_code
    @full_right = 0
    @almost_right = 0
    @play = Guess.new
  end

  def play_game
    @round = 0
    @win = false

    until @round > 12 || @win == true
      @arr = @play.play_round
      binding.pry
      @round += 1

      if @arr == @comp_select
        @win = true
      end

    end

    if @round > 12
      puts "You didn't find the code, try again"
      self.reset_game
    end

    if @win == true
      puts "You found the code in #{@round} rounds"
      self.reset_game
    end
  end

  private

  def reset_game
    @code = SecretCode.new
    @comp_select = @code.generate_code
    @full_right = 0
    @almost_right = 0
    @win = false
  end

end