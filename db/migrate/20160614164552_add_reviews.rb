class AddReviews < ActiveRecord::Migration
  def change
  	create_table "reviews" do |t|
  		t.integer "user_id"
  		t.integer "track_id"
  		t.text "text"
  		t.datetime "created_at"
  		t.datetime "updated_at"
  	end
  end
end
