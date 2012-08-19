class Movie < ActiveRecord::Base
  class Movie::NoDirectorError < StandardError ; end
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def find_similar_movies(id)
    movie = self.find(id)
    raise Movie::NoDirectorError if movie.director.empty?
    self.find_by_director(movie.director)
  end
end
