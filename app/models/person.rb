class Person < ActiveRecord::Base
    validates :name, presence: true, #{ message: "must enter a name" },
                     length: { maximum: 15 }
    
    has_and_belongs_to_many :needed_toppings, :class_name => "Topping", :join_table => "people_need_toppings"
    has_and_belongs_to_many :wanted_toppings, :class_name => "Topping", :join_table => "people_want_toppings"
    has_and_belongs_to_many :mehed_toppings, :class_name => "Topping", :join_table => "people_meh_toppings"
    has_and_belongs_to_many :hated_toppings, :class_name => "Topping", :join_table => "people_hate_toppings"
    
    has_one :account
    
    has_many :invitations
    has_many :events, :through => :invitations
end
