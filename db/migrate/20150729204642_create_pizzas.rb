class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string :name
      t.references :event, index: true

      t.timestamps
    end
  end
end
