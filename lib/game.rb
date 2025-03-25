# frozen_string_literal: true

require_relative 'guess'
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

      @win = true if @arr == @comp_select

    end

    if @round > 12
      puts "You didn't find the code, try again"
      reset_game
    end

    return unless @win == true

    puts "You found the code in #{@round} rounds"
    reset_game
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
