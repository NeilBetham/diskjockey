class User < ActiveRecord::Base
  ROLES = %i(admin broadcast dj inactive blocked)
  STATUSES = %i(student employee local)

  validates :email, :phone, :phone_carrier, :role, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /@mtu.edu/ }

  has_many :song_logs
  has_many :discrepancy_logs
  has_and_belongs_to_many :shows
  has_and_belongs_to_many :dj_applications
end
