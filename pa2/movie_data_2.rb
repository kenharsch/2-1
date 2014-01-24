


#movie_data.rb file, Software Eng. 236, Brandeis U.
#Ken Harsch
#kharsch@brandeis.edu


class MovieData
  attr_reader :rating_list, :similarity, :similar_list

  def initialize
    @rating_list = Array.new
  end


  def load_data
    File.open("u.data", "r") do |file|
      while line = file.gets
        temp = line.split("\t")
        rating = MovieRating.new(temp[0].to_i, temp[1].to_i, temp[2].to_i, temp[3].to_i) 
       @rating_list << rating
        end
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
    
    def popularity_list
      pop_list = []
      rating_list.each do |rating| 
        mp = MoviePop.new(rating.movie_id)
        pop_list << mp  
        end
      return pop_list.sort_by{|movie_id, pop| pop}
    end
    
    def top_ten
      puts "The Top Ten Movies:"
      for i in 0..9
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
        user_list1 = []
        if rating.user_id == user1
          user_rate = MovieRating.new(rating.user_id, rating.movie_id, rating.rating)
          @user_list1 << user_rate
        end
        end
     temp = 1
     i = 1
     rating_list.each do |rating|
       
         if rating.user_id == user2 && user_list1.include?(rating.movie_id)
           i += 1
           diff = (rating.rating - user_list1.movie_id.rating).abs
           temp += diff
         end
         end
         similarity_rating = 5 - temp/i
end
     
    
    
def most_similar
  
  user_list = []
  user_list2 = []
  rating_list.each do |rating|
      user = User.new(rating.user_id)
      user_list << user
      user_list2 << user
    end
    user_list.uniq
    user_list2.uniq
    
    limit = user_list.length
    user_list.each do |user_id|
    similar_list = []
   for i in 0..limit
   list_entry = user_list2[i]
   user_list2.delete(user_id)
   user_list2.delete(list_entry)
   sim = similarity(user_d, list_entry)
   sp = SimilarPair.new(user_id, list_entry, sim)
   similar_list << sp
   end
    end
  puts "Most Similar:"
  for i in 0..9
    puts similar_list[i]
end   
end
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
   
   def user?(user_id)
     @rating_list.map(&:user_id).include?user_id
   end
   
end

class MoviePop
attr_reader :movie_id, :pop
def initialize(movie_id)
  @movie_id = movie_id
end
def pop (movie_id)
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

 
class SimilarPair
  attr_reader :user_id, :user_id2, :similarity
  def initialize (user_id, user_id2, similarity)
    @user_id = user_id
    @user_id2 = user_id2
    @similarity = similarity
  end
end
 
class User
  attr_reader :user_id
  def initialize(user_id)
    @user_id = user_id
  end
end
  
