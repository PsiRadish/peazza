class PeopleHateToppings < ActiveRecord::Base
  belongs_to :person
  belongs_to :topping
end
