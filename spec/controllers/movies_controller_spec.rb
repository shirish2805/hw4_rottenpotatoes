require 'spec_helper'

describe MoviesController do
  describe 'find similar movies' do
    before :each do
      @fake_results = [mock('movie1'), mock('movie2')]
    end
    it 'should call the model method that perform search for similar movies' do
      Movie.should_receive(:find_similar_movies).and_return(@fake_results)
      get :similar_movies, {:id => '1'}
    end
    it 'should select the Similar Movies template for rendering' do
      Movie.stub(:find_similar_movies).and_return(@fake_results)
      get :similar_movies, {:id => '1'}
      response.should render_template('similar_movies')
    end
    it 'should make the search results available to that template' do
      Movie.stub(:find_similar_movies).and_return(@fake_results)
      get :similar_movies, {:id => '1'}
      assigns(:movies).should == @fake_results
    end
    it 'should select the home page on error' do
      Movie.stub(:find_similar_movies).and_raise(Movie::NoDirectorError)
      get :similar_movies, {:id => '1'}
      response.should redirect_to('/')
    end
  end
end
