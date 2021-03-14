class Movie < ActiveRecord::Base
    def self.all_ratings
        ['G','PG','PG-13','R']
    end
    
    def self.with_director(director)
        if director.blank? or director.nil?
            return
        else
            movies = self.where(director: director)
            return movies
        end
    end
    
end
