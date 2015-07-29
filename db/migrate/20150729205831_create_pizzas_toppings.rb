class CreatePizzasToppings < ActiveRecord::Migration
  def change
    create_table :pizzas_toppings, :id => false do |t|
      t.references :pizza, index: true
      t.references :topping, index: true
      
      t.timestamps
    end
  end
end
