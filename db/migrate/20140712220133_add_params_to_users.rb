class AddParamsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :semesters_on_air, :integer
    add_column :users, :relevant_experience, :text
    add_column :users, :employment_status, :string
    add_column :users, :station_staff, :boolean, default: false
  end
end
