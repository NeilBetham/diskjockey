class DiscrepancyLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :show

  validates :song_name, :artist, :word, presence: true
end
