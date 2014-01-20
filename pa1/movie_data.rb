
#
#
#
require_relative 'rating'
require_relative 'user'
require_relative 'movie'


class MovieData
  attr_reader :rating_list

  def initialize
    @rating_list = []
  end


  def load_data
    File.open("u.data", "r") do |file|
      while line = file.gets
       rating = new MovieRating (line.split("\t"))
        rating_list.add(rating)
        end
    end
    puts rating_list[1, 2, 4]
  end


end
