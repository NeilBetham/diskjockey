class CreateDjApplications < ActiveRecord::Migration
  def change
    create_table :dj_applications do |t|
      t.string :show_name
      t.text :bands_or_artists_played
      t.string :show_genre
      t.text :show_blurb
      t.datetime :training_time

      t.timestamps
    end
  end
end
