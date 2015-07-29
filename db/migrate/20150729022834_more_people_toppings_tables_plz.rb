class MorePeopleToppingsTablesPlz < ActiveRecord::Migration
  def change
    rename_table :people_toppings, :people_need_toppings
    
    create_table :people_want_toppings, :id => false do |t|
      t.references :person, index: true
      t.references :topping, index: true
      
      t.timestamps
    end
    
    create_table :people_meh_toppings, :id => false do |t|
      t.references :person, index: true
      t.references :topping, index: true
      
      t.timestamps
    end
    
    create_table :people_hate_toppings, :id => false do |t|
      t.references :person, index: true
      t.references :topping, index: true
      
      t.timestamps
    end
  end
end
