class CreateSubListUsers < ActiveRecord::Migration
  def change
    create_table :sub_lists_users, :id => false do |t|
      t.references :user, index: true
      t.references :sub_list, index: true
    end
  end
end
