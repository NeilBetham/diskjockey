class Genre < ActiveRecord::Base
    GENRES = %i(
      Alternative Ambient Blues Country
      Eclectic Electronic Folk Hip-Hop
      Hits Indie Jazz Local Metal Punk
      Reggae Rock Ska Talk Urban World
      Other
    )

    has_many :dj_application_genres
    has_many :dj_applications, through: :dj_application_genres
end
