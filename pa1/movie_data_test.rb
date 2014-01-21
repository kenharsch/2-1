







#test file for movie_data pa1
#Ken Harsch
#kharsch@brandeis.edu

require_relative 'movie_data'

m = MovieData.new
m.load_data


m.top_ten
m.bottom_ten
puts "Popularity of Movie 328 is:"
puts m.popularity(328)
puts "The similarity rating between user 881250949186 and 879467295213 is:"
puts m.similarity(881250949186, 879467295213)

puts "The most similar program takes a loooong time to run, so I've held off here."
#m.most_similar
