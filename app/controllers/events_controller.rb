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
        new_event = Event.create blablabla
        
        redirect_to event_path(new_event)
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private #############
    
    # data structure to help with formulating pizzas
    GroupToppings = Struct.new(:needed_toppings, :wanted_toppings, :mehed_toppings, :hated_toppings) do
        def initialize(*args)
            super(*args)
            
            self.needed_toppings = {}
            self.wanted_toppings = {}
            self.mehed_toppings = {}
            self.hated_toppings = {}
        end
    end
    
    def formulate_pizzas people
        groups_members = [[]]
        groups_toppings = [ Struct::GroupToppings.new ]
        
        i = 0
        people.each do |person|
            groups_members[i] << person.id
            groups_toppings[i].members.each do |list_name|
                if person != people.first
                    # LOGIC
                end
                
                
                
                person_arr = person.public_send(list_name).pluck(:id)
                person_hash = person_arr.reduce({}){ |hash, id| hash[id] = true; hash }
                group_hash = group_toppings[i][list_name]
                
                group_hash = group_hash.merge(person_hash)
            end
        end
    end
    
end

