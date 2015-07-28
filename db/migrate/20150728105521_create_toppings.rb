class CreateToppings < ActiveRecord::Migration
  def change
    create_table :toppings do |t|
      t.string :name
      t.string :type
      t.integer :needer_id, index: true
      t.integer :wanter_id, index: true
      t.integer :meher_id, index: true
      t.integer :hater_id, index: true

      t.timestamps
    end
  end
end
