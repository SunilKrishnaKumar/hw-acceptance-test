require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    
    describe MoviesController do
        describe 'addDirector' do
            before :each do
                @movie = mock(Movie, :title => "Star Wars", :director => "director", :id => "1")
            end
        end
    end

end
