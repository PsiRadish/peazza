class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :account, index: true
      t.string :name
      t.string :location_street_address
      t.string :location_city
      t.string :location_state, :limit => 12  # longest state is Rhode Island with 12 characters
      t.string :location_zip, :limit => 9
      t.datetime :date
      
      t.timestamps
    end
  end
end
