class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :person, index: true
      t.references :event, index: true

      t.timestamps
    end
    
    #oh, and friendships table is missing timestamps
    add_column(:friendships, :created_at, :datetime)
    add_column(:friendships, :updated_at, :datetime)
  end
end
