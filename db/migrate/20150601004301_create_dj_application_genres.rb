class CreateDjApplicationGenres < ActiveRecord::Migration
  def change
    create_table :dj_application_genres do |t|
      t.belongs_to :dj_application, index: true
      t.belongs_to :genre, index: true

      t.timestamps
    end
  end
end
