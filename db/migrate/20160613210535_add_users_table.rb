class AddUsersTable < ActiveRecord::Migration
  def change
  	create_table "users" do |t|
  		t.string "username"
  		t.string "email"
  		t.string "password"
  		t.datetime "created_at"
  		t.datetime "updated_at"
  	end
  end
end
