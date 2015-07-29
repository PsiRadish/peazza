class CreateFriendships < ActiveRecord::Migration
  def change
    
    
    create_table :friendships do |t|
        t.integer :friender_id, index: true
        t.integer :friend_id, index: true
    end
  end
end
