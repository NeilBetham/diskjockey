class DjApplication < ActiveRecord::Base
  GENRES = %i(
    Alternative Ambient Blues Country
    Electronic Folk Hits Indie
    Jazz Hip-Hop Local Metal
    Punk Reggae Rock Ska
    Talk Urban Eclectic World
    Other
  )

  has_and_belongs_to_many :users

  validates :show_name, presence: true
end
