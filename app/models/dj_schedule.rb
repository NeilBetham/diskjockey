class DjSchedule < ActiveRecord::Base
  has_many :dj_slots, dependent: :destroy
  accepts_nested_attributes_for :dj_slots
end
