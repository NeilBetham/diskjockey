class RemoveShowGenreFromDjApplication < ActiveRecord::Migration
  def change
    remove_column :dj_applications, :show_genre, :string
  end
end
