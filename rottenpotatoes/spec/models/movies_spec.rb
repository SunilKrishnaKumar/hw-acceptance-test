require 'rails_helper'

RSpec.describe Movies, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
    # describe Movies do
    describe 'Movies with same director ' do
        it 'should call Movie.with_director' do
            Movie.should_receive(:with_director).with('Aladdin')
            # Movie.with_director('')
            # end
        end
    end
end
