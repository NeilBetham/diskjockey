class DjApplicationGenre < ActiveRecord::Base
  belongs_to :dj_application
  belongs_to :genre
end
