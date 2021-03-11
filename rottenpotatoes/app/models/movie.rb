class Movie < ActiveRecord::Base
    def self.with_director(director)
        if director.nil?
            return
        else
            movies = self.where(director: director)
            return movies
        end
    end
    
end
