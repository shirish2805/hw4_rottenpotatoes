require 'spec_helper'

describe Movie do
  fixtures :movies
  describe 'find similar movies' do
    it 'should raise a NoDirectorError when movie has no director info' do
      movie1 = mock('movie1')
      movie1.stub(:title).and_return('Movie1')
      movie1.stub(:director).and_return('')
      Movie.stub(:find).and_return(movie1)
      lambda { Movie.find_similar_movies(1) }.should raise_error(Movie::NoDirectorError)
    end
  end
end
