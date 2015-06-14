class DjApplication < ActiveRecord::Base
  attr_reader :genre_string

  validates :show_name, :show_blurb, presence: true

  has_and_belongs_to_many :users
  has_and_belongs_to_many :genres

  def genre_string
    self.genres.map(&:name).sort.join(", ")
  end
end
