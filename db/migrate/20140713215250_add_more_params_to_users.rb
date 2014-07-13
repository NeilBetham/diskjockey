class AddMoreParamsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_token, :text
    add_column :users, :confirmed, :boolean, default: false
  end
end
