class Topping < ActiveRecord::Base
    has_and_belongs_to_many :needers, :class_name => "Person", :join_table => "people_need_toppings"
    has_and_belongs_to_many :wanters, :class_name => "Person", :join_table => "people_want_toppings"
    has_and_belongs_to_many :mehers, :class_name => "Person", :join_table => "people_meh_toppings"
    has_and_belongs_to_many :haters, :class_name => "Person", :join_table => "people_hate_toppings"
    
    has_and_belongs_to_many :pizzas
end
