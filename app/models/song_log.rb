class SongLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  
  validates :song_name, :artist, :genre, :album, presence: true
end
