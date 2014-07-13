class Show < ActiveRecord::Base
  has_and_belongs_to_many :user
  has_many :song_logs
  has_many :discrepancy_logs

  validates :name, presence: true
end
