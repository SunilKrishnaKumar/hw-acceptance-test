require 'rails_helper'

RSpec.describe Movie, type: :model do
    before :each do
        Movie.create(title: 'Star Wars', rating: 'PG', director: 'George Lucas', release_date: Date.new(1977,5,25))
        Movie.create(title: 'Blade Runner', rating: 'PG', director: 'Ridley Scott', release_date: Date.new(1982,6,25))
        Movie.create(title: 'THX-1138', rating: 'R', director: 'George Lucas', release_date: Date.new(1971,3,11))

        @movies = Movie.all
      end
#   pending "add some examples to (or delete) #{__FILE__}"
    # describe Movies do
    describe 'Movies with same director ' do
        it 'should call Movie.with_director' do
            Movie.should_receive(:with_director).with('George Lucas')
            Movie.with_director('George Lucas')
            # end
        end
    end
end
