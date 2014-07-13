class CreateShowArchives < ActiveRecord::Migration
  def change
    create_table :show_archives do |t|
      t.references :show, index: true
      t.text :file
      t.text :location
      t.boolean :error
      t.text :reason

      t.timestamps
    end
  end
end
