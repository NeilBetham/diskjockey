class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.references :user, index: true
      t.text :token
      t.datetime :valid_till

      t.timestamps
    end
  end
end
