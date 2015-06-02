class AddDefaultValueToUserRole < ActiveRecord::Migration
  def change
    change_column_default :users, :role, 'dj'
  end
end
