class DjSlot < ActiveRecord::Base
  belongs_to :dj_schedule
  has_one :show
end
