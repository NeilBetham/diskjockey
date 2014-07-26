class DjSchedule < ActiveRecord::Base
  has_many :dj_slots
  accepts_nested_attributes_for :dj_slots
end
