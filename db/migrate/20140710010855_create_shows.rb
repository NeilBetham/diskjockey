class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.references :user, index: true
      t.time :start_time
      t.time :stop_time
      t.integer :day_of_week

      t.timestamps
    end
  end
end
