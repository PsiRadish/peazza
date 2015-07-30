class Event < ActiveRecord::Base
    validates :name, presence: true, length: { maximum: 15 }
    
    belongs_to :account
    
    has_many :invitations
    has_many :people, :through => :invitations
    
    has_many :pizzas
end
