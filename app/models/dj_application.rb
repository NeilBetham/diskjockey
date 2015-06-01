class DjApplication < ActiveRecord::Base
  validates :show_name, :show_blurb, :genre_array, presence: true

  has_and_belongs_to_many :users
  has_many :dj_application_genres
  has_many :genres, through: :dj_application_genres

  def genre_array=(array)
    array.reject! { |item| item.blank? }
    self.show_genre = array.join ", "
    #self.genres = array.each do |name|
    #  Genre.where(name: name.strip).first_or_create!
    #end
  end

  def genre_array
    if self.show_genre.blank?
      []
    else
      self.show_genre.split ", "
    end
    #self.genres.map(&:name)
  end
end
