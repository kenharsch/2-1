#test file for movie_data pa1
#Ken Harsch
#kharsch@brandeis.edu

require_relative 'new_movie_data'

m = MovieData.new
m.load_data
m.calc_popularity
puts "pop of 242 = "
puts m.popularity(242)
puts m.popularity(9999999)
m.top_ten
m.bottom_ten
puts "pop of 51 = "
puts m.popularity(51)