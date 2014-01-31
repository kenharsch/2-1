#movie_data class 
#Ken Harsch
#kharsch@brandeis.edu
require_relative 'movie.rb'
require_relative 'user.rb'
require_relative 'rating.rb'

class MovieData
	attr_reader :rating_list, :user_list, :movie_list, :popularity_list, :similarity, :most_similar

	def initialize
		@rating_list = []
		@user_list = []
		@movie_list = []
        @popularity_list = Hash.new {|movie_id, rating|}
	end

	def load_data
		File.open("u.data", "r").each_line do |line|
        	temp = line.split
        	@rating_list.push([temp[0].to_i, temp[1].to_i, temp[2].to_i, temp[3].to_i])
            @user_list.push([temp[0].to_i])  
            @movie_list.push([temp[1].to_i])  	
        end
        user_list.uniq!
        movie_list.uniq!
    end

    def calc_popularity
        #Popularity is calculated as the sum of the number of times watched
        #and the total ratings awarded. 
        rating_list.each do |rating|
            if @popularity_list[rating[1]]
                @popularity_list[rating[1]] += rating[2]
            else
                 @popularity_list[rating[1]] = rating[2]
            end
        end
        @popularity_list = @popularity_list.sort_by{|movie_id, rating| rating}.reverse
    end

    def popularity (movie_id)
       return @popularity_list[movie_id]
    end

    def popularity_list
        return @popularity_list
    end

    def top_ten
        puts "The top ten movies with ratings are: "
            for i in 0 ..9
            puts popularity_list[i]
        end
    end
    
    def bottom_ten
        puts "The bottom ten movies with ratings are: "
        j = popularity_list.length
        for i in 0 ..9
            puts popularity_list[j - i]
        end
    end

    def similarity (user1, user2)
        sim = 0
        @rating_list.each do |rating|
           if rating[0] == user1
            movtemp = rating[1]
            ratetemp = rating[2]
            @rating_list.each do |rating|
                if rating[0] == user2 and rating[1] == movtemp
                    sim = 5 - (ratetemp - rating[3]).abs
                end
            end
        end
        return sim
    end

    def most_similar (user1)
        best = 0
        most_sim = nil
        @user_list.each do |user|
            s = similarity(user1, user[0])
            if s > best
                best = s
                most_sim = user[0]
            end
        end
        puts "The user who is most similar to #{user1} is: "
        puts most_sim
    end

end

    end


