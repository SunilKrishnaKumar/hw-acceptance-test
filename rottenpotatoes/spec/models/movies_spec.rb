require 'rails_helper'

RSpec.describe Movie, type: :model do
    before :each do
        @movie1 = Movie.create(title: 'Star Wars', rating: 'PG', director: 'George Lucas')
        @movie2 = Movie.create(title: 'Blade Runner', rating: 'PG', director: 'Ridley Scott')
        @movie3 = Movie.create(title: 'THX-1138', rating: 'R', director: 'George Lucas')
        @movie4 = Movie.create(title: 'Alien')

        # @movies = Movie.all
      end
#   pending "add some examples to (or delete) #{__FILE__}"
    # describe Movies do
    describe 'Movies with same director ' do
        context 'When director exists' do
            it 'should call Movie.with_director' do
            # puts((Movie.should_receive(:with_director).with('George Lucas')).pluck(:title))
            expect(Movie.with_director(@movie1.director).pluck(:title)).to_not include(@movie2.title)
            # puts Movie.with_director('George Lucas').pluck(:title)
            expect(Movie.with_director(@movie1.director).pluck(:title)).to include(@movie1.title, @movie3.title)
            # end
            end
        end
        
        context 'When director does not exists' do
            it 'should output nil' do
                expect(Movie.with_director(@movie4.director)).to eql(nil)
            end
        end
    end
    
    describe 'Movie.all_ratings' do
        it 'return all ratings' do
            puts Movie.all_ratings
            Movie.all_ratings.should eql(['G','PG','PG-13','R'])
        end
    end
end
