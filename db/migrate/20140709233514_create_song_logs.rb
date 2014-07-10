class CreateSongLogs < ActiveRecord::Migration
  def change
    create_table :song_logs do |t|
      t.string :cd_number
      t.string :song_name
      t.string :artist
      t.string :genre
      t.string :album
      t.integer :score
      t.string :location
      t.references :user, index: true

      t.timestamps
    end
  end
end
