class Event < ActiveRecord::Base
    belongs_to :account
    
    has_many :invitations
    has_many :people, :through => :invitations
    
    has_many :pizzas
end
