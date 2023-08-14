require "open-uri"


class GamesController < ApplicationController
  def new
    letter = ('a'..'z').to_a
    @letters = letter.sample(10)
  end

  def score
    @word = params[:word]
    @letters = params[:letters]
    if check_english?(@word) && array?(@word, @letters)
      @found = "yes"
    else
      @found = "no"

    end
  end

  def check_english?(word)
    # create a function to check if a word is in the english dictionary
    # use the API to pass in a word
    # return true or false is the word exists.
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
    user["found"]
  end

  def array?(word, letters)
    # split the word into characters
    user_input = word.chars
    # iterate through them
    user_input.each do |character|
      letters.include?(character)
    end
    # how many times does the letter appears in the aray to see if it appears the same amount of times in the array than in the actual word
  end
end
