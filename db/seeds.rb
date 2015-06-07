# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
GENRES = %i(
  Alternative Ambient Blues Classical
  Comedy Country Easy\ Listening Eclectic
  Electronic Folk Funk/Soul Hip-Hop
  Hits Indie Jazz Local Metal Pop Punk
  R&B Reggae Rock Ska Soundtrack Talk
  Urban World Other
)

GENRES.each do |genre|
  Genre.create name: genre
end
