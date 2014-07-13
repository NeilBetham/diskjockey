class CreateDjSchedules < ActiveRecord::Migration
  def change
    create_table :dj_schedules do |t|
      t.date :start_date
      t.date :stop_date

      t.timestamps
    end
  end
end
