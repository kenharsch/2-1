#Movie class for movie_data
#Ken Harsch
#kharsch@brandeis.edu

class Movie
	attr_reader :movie_id, :popularity
	def initialize (movie_id, popularity)
		@movie_id = movie_id
		@popularity = popularity
	end
end