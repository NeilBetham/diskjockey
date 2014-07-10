class SongLog < ActiveRecord::Base
  belongs_to :user
  validates :song_name, :artist, :genre, :album, presence: true
end
