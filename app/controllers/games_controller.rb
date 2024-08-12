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
    @user_found = user["found"]
  end

  def score
    @word = params[:word]
    @english_word = english_check(@word)
    @letter = params[:letter_array].split
    @included = included?(@word, @letter)
    p @english_word
    p @included
  end
  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end
end
