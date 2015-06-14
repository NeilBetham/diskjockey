class DjSlot < ActiveRecord::Base
  belongs_to :dj_schedule
  has_and_belongs_to_many :users
  has_many :shows
end
