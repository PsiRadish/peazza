class CreatePeopleToppings < ActiveRecord::Migration
  def change
    create_table :people_toppings, :id => false do |t|
      t.references :person, index: true
      t.references :topping, index: true

      t.timestamps
    end
    # add_index :people_toppings, [:person_id, :topping_id], unique: true
    
    #remove silly things from toppings table
    remove_column :toppings, :needer_id, :integer
    remove_column :toppings, :wanter_id, :integer
    remove_column :toppings, :meher_id, :integer
    remove_column :toppings, :hater_id, :integer
    # and fix a silly column name
    rename_column :toppings, :type, :category
  end
end
