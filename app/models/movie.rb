class Movie < ActiveRecord::Base
  class Movie::NoDirectorError < StandardError ; end
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.find_similar_movies(id)
    movie = Movie.find(id)
    if movie.director.empty? then
      raise Movie::NoDirectorError, "'#{movie.title}' has no director info"
    end
    Movie.find_all_by_director(movie.director)
  end
end
