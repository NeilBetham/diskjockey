class RemoveDjSlotFromShows < ActiveRecord::Migration
  def change
    remove_reference :shows, :dj_slot, index: true
  end
end
