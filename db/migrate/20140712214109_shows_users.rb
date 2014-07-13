class ShowsUsers < ActiveRecord::Migration
  create_table :shows_users, :id => false do |t|
     t.integer :show_id
     t.integer :user_id
   end
end
