class User < ActiveRecord::Base
  ROLES = %i(admin broadcast dj inactive blocked)

  validates :email, :phone, :phone_carrier, :role, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  has_many :song_logs
end
