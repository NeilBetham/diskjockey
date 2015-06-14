class User < ActiveRecord::Base
  ROLES = %i(admin broadcast dj inactive blocked)
  STATUSES = %i(student employee local)

  before_validation :set_role

  has_secure_password

  validates :name, :email, :phone, :phone_carrier, :role, :employment_status, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /@mtu.edu/ }, unless: :status_local?

  has_many :song_logs, through: :shows
  has_many :discrepancy_logs
  has_many :user_events
  has_many :tokens, dependent: :destroy
  has_and_belongs_to_many :shows
  has_and_belongs_to_many :dj_applications
  has_and_belongs_to_many :sub_lists
  has_and_belongs_to_many :dj_slots

  def status_local?
    employment_status.downcase == "local"
  end

  # Get the most recent show created for a user
  def current_show
    shows.order('created_at DESC').first
  end

  # Selects the closest DJ slot to the current time should a user have more than one
  def current_dj_slot
    dj_slots.order('created_at DESC').order("ABS(start_time - #{Time.now.to_i})").first
  end

  private

  def set_role
    self.role = 'dj' unless self.role
  end
end
