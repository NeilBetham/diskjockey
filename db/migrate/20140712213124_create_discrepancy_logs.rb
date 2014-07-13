class CreateDiscrepancyLogs < ActiveRecord::Migration
  def change
    create_table :discrepancy_logs do |t|
      t.references :user, index: true
      t.string :song_name
      t.string :artist
      t.string :word
      t.string :cd_number
      t.boolean :button_pressed, default: false

      t.timestamps
    end
  end
end
