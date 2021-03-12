require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    
    describe 'addDirector' do
        before :each do
            @movie = mock(Movie, :title => "Star Wars", :director => "director", :id => "1")
            Movie.stub!(:find).with("1").and_return(@movie)
        end
        it 'should call update_attributes and redirect' do
            @movie.stub!(:update_attributes!).and_return(true)
            put :update, {:id => "1", :movie => @m}
            response.should redirect_to(movie_path(@m))
        end
    end



end
