class Genre < ActiveRecord::Base
    GENRES = %i(
      Alternative Ambient Blues Country
      Electronic Folk Hits Indie
      Jazz Hip-Hop Local Metal
      Punk Reggae Rock Ska
      Talk Urban Eclectic World
      Other
    )

    has_many :dj_application_genres
    has_many :dj_applications, through: :dj_application_genres
end
