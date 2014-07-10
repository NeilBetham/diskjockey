class SongLogSerializer < ActiveModel::Serializer
  attributes :id, :cd_number, :song_name, :artist, :genre, :album, :score, :location
  has_one :user
end
