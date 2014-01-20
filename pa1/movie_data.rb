










#movie_data.rb file, Software Eng. 236, Brandeis U.

#Ken Harsch
#kharsch@brandeis.edu

class MovieData
  attr_reader :rating_list

  def initialize
    @rating_list = Array.new
  end


  def load_data
    File.open("data.data", "r") do |file|
      while line = file.gets
        temp = line.split("\t")
        rating = MovieRating.new(temp[0].to_i, temp[1].to_i, temp[2].to_i, temp[3].to_i) 
       @rating_list << rating
        end
    end
    
    def popularity_list
      pop_list = []
      rating_list.each do |rating| 
        mp = MoviePop.new(rating.movie_id)
      pop_list << mp
      end
    end
    
    
    def similarity(user1, user2)
      
      
      
    end
end


class MovieRating

attr_reader :user_id, :movie_id, :rating

 def initialize (user_id, movie_id, rating, timestamp)
    @user_id = user_id
    @movie_id = movie_id
    @rating = rating
    @timestamp = timestamp
   end
end

class MoviePop
attr_reader :movie_id, :popularity
def initialize(movie_id)
  @movie_id = movie_id
end

def popularity (movie_id)
      i = 0
      raw_rating = 0
      rating_list.each do |rating|
          if (rating.movie_id == movie_id)
            i += 1
            raw_rating += rating.rating
          end
      end
      return raw_rating/i
    end
end

class PopRate
  attr_reader :movie_id, :popularity
      def initialize (movie_id, popularity)
        @movie_id = movie_id
        @popularity = movie_id.poplarity
      end
end

class User
attr_reader :user_id

  def initialize
    @user_id = user_id
    end
end

end



