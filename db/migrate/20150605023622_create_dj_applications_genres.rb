class CreateDjApplicationsGenres < ActiveRecord::Migration
  def change
    create_table :dj_applications_genres, id: false do |t|
      t.belongs_to :dj_application, index: true
      t.belongs_to :genre, index: true
    end
  end
end
