class DjApplicationsUsers < ActiveRecord::Migration
  def change
    create_table :dj_applications_users, :id => false do |t|
       t.integer :dj_application_id
       t.integer :user_id
     end
  end
end
