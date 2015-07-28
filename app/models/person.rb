class Person < ActiveRecord::Base
    has_many :needed_toppings, :class_name => "Topping", :foreign_key => "needer_id"
    has_many :wanted_toppings, :class_name => "Topping", :foreign_key => "wanter_id"
    has_many :mehed_toppings, :class_name => "Topping", :foreign_key => "meher_id"
    has_many :hated_toppings, :class_name => "Topping", :foreign_key => "hater_id"
    has_one :account
end
