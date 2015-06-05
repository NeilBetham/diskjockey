class Genre < ActiveRecord::Base
    GENRES = %i(
      Alternative Ambient Blues Country
      Eclectic Electronic Folk Hip-Hop
      Hits Indie Jazz Local Metal Punk
      Reggae Rock Ska Talk Urban World
      Other
    )

    has_and_belongs_to_many :dj_applications
end
