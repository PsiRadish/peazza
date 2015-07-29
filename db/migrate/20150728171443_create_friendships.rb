class CreateFriendships < ActiveRecord::Migration
  def change
    
    
    create_table :friendships do |t|
        t.integer :friender_id, index: true
        t.integer :friend_id, index: true
    end
    
    # create_table :events do |t|
    #   t.string :name
    #   t.string :location_street_address
    #   t.string :location_city
    #   t.string :location_state, :limit => 12  # longest state is Rhode Island with 12 characters
    #   t.string :location_zip, :limit => 9
    
      
    #   t.timestamps
    # end
  end
end
