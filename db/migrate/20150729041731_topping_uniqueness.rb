class ToppingUniqueness < ActiveRecord::Migration
    def change
        add_index :toppings, [:name, :category], :unique => true
    end
end
