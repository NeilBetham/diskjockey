class DiscrepancyLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :show

  validates :song_name, :artist, :word, :button_pressed, presence: true
end
