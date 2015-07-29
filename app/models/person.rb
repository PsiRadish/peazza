class Person < ActiveRecord::Base
    has_and_belongs_to_many :needed_toppings, :class_name => "Topping", :join_table => "people_need_toppings"
    has_and_belongs_to_many :wanted_toppings, :class_name => "Topping", :join_table => "people_want_toppings"
    has_and_belongs_to_many :mehed_toppings, :class_name => "Topping", :join_table => "people_meh_toppings"
    has_and_belongs_to_many :hated_toppings, :class_name => "Topping", :join_table => "people_hate_toppings"
    
    has_one :account
end
