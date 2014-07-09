class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :phone
      t.string :phone_carrier
      t.text :google_api_token

      t.timestamps
    end
  end
end
