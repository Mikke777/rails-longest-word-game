require 'json'
require 'open-uri'

class GamesController < ApplicationController

  def new
    def generate_letters(number)
      charset = Array('A'..'Z')
      Array.new(number) { charset.sample }.join
    end
    @letter_array = generate_letters(9).split("")
  end

  def english_check(word)
    url = "https://dictionary.lewagon.com/#{word}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
    user[:"found"]
    raise
  end

  def score
    @word = params[:word]
    @english_word = english_check(@word)
    @letter = params[:letter_array]

    def inside
      @letter_array.include? @letter
    end
  end
end
