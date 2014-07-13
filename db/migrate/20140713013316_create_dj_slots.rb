class CreateDjSlots < ActiveRecord::Migration
  def change
    create_table :dj_slots do |t|
      t.references :dj_schedule, index: true
      t.time :start_time
      t.time :stop_time
      t.integer :day_of_week

      t.timestamps
    end
  end
end
