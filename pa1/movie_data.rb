
#movie_data_2.rb file, Software Eng. 236, Brandeis U.
#Ken Harsch
#kharsch@brandeis.edu


class MovieData
  attr_reader :rating_list, :similarity, :similar_list, :user_list, :movie_list, :popularity_list, :similarity_rating

  def initialize
    @rating_list = Array.new
    @user_list = Array.new
    @movie_list = Array.new
    @similar_list = Array.new
  end

  def load_data
    File.open("u.data", "r") do |file|
      while line = file.gets
        temp = line.split("\t")
        rating = Rating.new(temp[0].to_i, temp[1].to_i, temp[2].to_i, temp[3].to_i)
        user = User.new(temp[0])
        movie = Movie.new(temp[1])
        @user_list << user 
        @movie_list << movie
        @rating_list << rating
        end
    end
    user_list.uniq
    movie_list.uniq
  end
  
  def popularity (movie_id)
    mov = Movie.new(movie_id)
    return mov.pop
  end

  def popularity_list
    return movie_list.sort_by{|movie_id, pop| pop}
  end
    
  def top_ten
    puts "The Top Ten Movies:"
    for i in 0 ..9
      puts popularity_list[i]
    end
  end
    
  def bottom_ten
    index = popularity_list.length
    puts "The Bottom Ten Movies:"
    for i in 1..10
      index -= i
      puts popularity_list[index]
    end
  end
    
  def similarity (user1, user2)
    #Similarity is calculated as an average of the absolute value of
    #the difference in ratings for movies both users have rated
    #this is subtracted from 5, which would be the largest possible
    #gap between two ratings. 0 - not similar to 5 - very similar

    rating_list.each do |rating|
      user1_rating_list = Array.new
      if rating.user_id == user1
        @user1_rating_list << rating
      end
    end

    temp = 1
    i = 1
    rating_list.each do |rating|   
      if rating.user_id == user2 && rating.movie_id = @user1_rating_list[rating.movie_id]
        i += 1
        diff = (rating.rating - user_list1.movie_id.rating).abs
        temp += diff
      end
    end
    similarity_rating = 5 - temp/i
  end
     
  def most_similar (user1)
    user_list.each do |user|
      s = similarity(user1, user.user_id)
      sr = SimilarityRating.new(user.user_id, s)
      @similar_list << sr
    end
    similar_list.sort_by{|user_id, similarity_rating| similarity_rating}
    puts "The most similar user to #{user} are:"
    for i in 0..9
      puts similar_list[i]
    end   
  end
  
end

class Rating
  attr_reader :user_id, :movie_id, :rating
  def initialize (user_id, movie_id, rating, timestamp)
    @user_id = user_id
    @movie_id = movie_id
    @rating = rating
    @timestamp = timestamp
  end   
end

class Movie
  attr_reader :movie_id, :pop_rate, :pop
  
  def initialize (movie_id)
    @movie_id = movie_id
    @pop = 0
  end

  def popularity (movie_id)
    i = 1
    raw_rating = 1
    rating_list.each do |rating|
      if (rating.movie_id == movie_id)
        i += 1
        raw_rating += rating.rating
      end
    end
    @pop = raw_rating/i
    return pop
  end 
end
 
class SimilarityRating
  attr_reader :user_id, :similarity_rating
  def initialize (user_id, similarity_rating)
    @user_id = user_id
    @similarity_rating = similarity_rating
  end
end
 
class User
  attr_reader :user_id
  def initialize (user_id)
    @user_id = user_id
  end
end
  
