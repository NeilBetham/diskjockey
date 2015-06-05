class Genre < ActiveRecord::Base
  GENRES = %i(
    Alternative Ambient Blues Classical
    Comedy Country Easy\ Listening Eclectic
    Electronic Folk Funk/Soul Hip-Hop
    Hits Indie Jazz Local Metal Pop Punk
    R&B Reggae Rock Ska Soundtrack Talk
    Urban World Other
  )

  has_and_belongs_to_many :dj_applications
end
