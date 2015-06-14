class CreateDjSlotsUsers < ActiveRecord::Migration
  def change
    create_table :dj_slots_users, id: false do |t|
      t.belongs_to :dj_slot, index: true
      t.belongs_to :user, index: true
    end
  end
end
