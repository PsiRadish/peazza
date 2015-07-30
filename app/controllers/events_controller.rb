class EventsController < ApplicationController
    before_action :is_authenticated?
    
    
    #Event
    # id: 1
    # account_id: 3
    # name: "The peace of the newly baked their black hands pro..."
    # location_street_address: nil
    # location_city: nil
    # location_state: nil
    # location_zip: nil
    # date: nil
    
    def index
        @events = @current_account.events
    end
    
    def show
        @event = Event.find params[:id]
    end
    
    def new
        
    end
    
    def create
        new
        
        redirect_to event_path(event)
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    def full_location_string
        #{}"#{self.location_street_address}, #{self.location_city}"
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

