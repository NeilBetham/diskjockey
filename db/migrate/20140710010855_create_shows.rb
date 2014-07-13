class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.references :user, index: true
      t.time :start_time
      t.time :stop_time
      t.integer :day_of_week
      t.text :bands_or_artists_played
      t.string :show_genre
      t.text :show_blurb

      t.timestamps
    end
  end
end
