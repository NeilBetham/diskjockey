class AddParamsToShows < ActiveRecord::Migration
  def change
    add_reference :shows, :dj_slot, index: true
  end
end
