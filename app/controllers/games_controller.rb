require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ("A".."Z").to_a
    @grid = []
    10.times { @grid << @letters.sample }
  end

  def score
    @letters = ("A".."Z").to_a
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    user_serialized = open(url).read
    @user = JSON.parse(user_serialized)
    @found = @user["found"]
    @word_check_result = check_word
    raise
  end

  def check_word
    @word = params[:word]
    @letters = ("A".."Z").to_a
    @word.each_char do |char|
      if !@grid.include? (char)
        return false
      end
    end
  end

  # private

  # def create_grid
  #   @letters = ("A".."Z").to_a
  #   @grid = []
  #   10.times { @grid << @letters.sample }
  # end
end



# <% if @word.present?
#   <% @word.each_char do |char| %>
#     <% if !@letters.include? (char) %>
#         Sorry but <%= @word.capitalize %> can't be built with</div>
#         <% break %>
#     <% else %>
#         <% if @found == true%>
#           <div>Congrats! <%= @word.capitalize  %> is a valid English word. </div>
#           <% else %>
#             <div>Sorry but <%= @word.capitalize %> is not an English word mate.</div>
#         <% end %>
#     <% end %>
#   <% end %>
# <% end %>



