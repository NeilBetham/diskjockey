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

  def status_local?
    employment_status.downcase == "local"
  end

  def current_show
    shows.order('created_at DESC').first
  end

  private

  def set_role
    self.role = 'dj' unless self.role
  end
end
