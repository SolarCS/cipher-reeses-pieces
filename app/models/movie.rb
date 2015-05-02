class Movie < ActiveRecord::Base
  belongs_to :user

  def self.build_from_itunes_response(movie)
    puts "Movie: " + movie.to_json
    Movie.create(:name => movie['trackName'], :artist => movie['trackArtist'], :censored_name => movie['trackCensoredName'], :genre => movie['genre'])
  end
end
