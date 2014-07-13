class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.references :user, index: true
      t.string :event_type
      t.string :event_title
      t.text :event_text

      t.timestamps
    end
  end
end
