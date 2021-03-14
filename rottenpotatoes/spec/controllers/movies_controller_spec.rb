require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    # before :each do
    let!(:movie1) { FactoryGirl.create(:movie, title: 'Star Wars', rating: 'PG', director: 'George Lucas' )}
    let!(:movie2) { FactoryGirl.create(:movie, title: 'Blade Runner', rating: 'PG', director: 'Ridley Scott')}
    let!(:movie3) { FactoryGirl.create(:movie,title: 'THX-1138', rating: 'R', director: 'George Lucas' )}
    let!(:movie4) { FactoryGirl.create(:movie, title: "No Name")}
        # @movies = Movie.all
    #   end
    
    describe 'Search movies by the same director' do
        it 'should call Movie.with_director' do
    # #       puts type(@movie1.director)
    # #       debugger
            expect(Movie).to receive(:with_director).with('George Lucas')
            get :search, title: movie1.title
    # #   puts m
        end

        it 'should assign similar movies if director exists' do
            movies = [movie1, movie2]
            Movie.stub(:with_director).with(movie1.director).and_return(movies)
            # debugger
            get :search, title: movie1.title
            response.should render_template('search')
            # assigns(:movies).should == movies
            expect(assigns(:similar_movies)).to eql(movies)
        end

        it "should redirect to home page if director isn't known" do
            # debugger
            Movie.stub(:with_director).with(movie4.director).and_return(nil)
            # get :search, { title: 'No name' }
            # expect(response).to redirect_to(root_url)
            get :search, title: movie4.title
            expect(response).to redirect_to(root_url)
            expect(flash[:alert]).to eq("'#{movie4.title}' has no director info")
    end
  end


end
