class Event < ActiveRecord::Base
    validates :name, presence: true, length: { maximum: 40 }
    
    belongs_to :account
    
    has_many :invitations
    has_many :people, :through => :invitations
    
    has_many :pizzas
    
    def full_location_string
        str = ''
        
        if self.location_street_address
            str += self.location_street_address
            if self.location_city or self.location_state
                str += ', '
            end
        end
        
        if self.location_city
            str += self.location_city
            if self.location_state
                str += ', '
            end
        end
        
        str += self.location_state ? self.location_state : ''
        
        str += self.location_zip ? self.location_zip : ''
    end
    
end
