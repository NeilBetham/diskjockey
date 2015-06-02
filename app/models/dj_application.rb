class DjApplication < ActiveRecord::Base
  attr_reader :genre_string

  validates :show_name, :show_blurb, :genres, presence: true

  has_and_belongs_to_many :users
  has_many :dj_application_genres
  has_many :genres, through: :dj_application_genres

  def genre_array=(array)
    array.reject! { |item| item.blank? }
    self.genres = array.map do |genre|
      Genre.where(name: genre.strip).first_or_create!
    end
  end

  def genre_array
    self.genres.map &:name
  end

  def genre_string
    self.genres.map(&:name).sort.join(", ")
  end
end
