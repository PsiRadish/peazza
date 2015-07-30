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
        groups = [ { members: [], toppings: Struct::GroupToppings.new } ]
        
        people.each do |person|
            
            groups[i][:members] << person.id
            groups[i][:toppings].members.each do |list_name|
                # want group and person topping lists as hashes with topping_ids as keys, because merge
                
                person_arr = person.public_send(list_name).pluck(:id) # I understand this much
                person_hash = person_arr.reduce({}){ |hash, id| hash[id] = true; hash } # but not quite this much
                
                
                group_hash = group_toppings[i][list_name]
                
                if person != people.first
                    # LOGIC
                end
                
                group_hash = group_hash.merge(person_hash)
            end
        end
    end
    
    def add_person_to_group person, group
        group[:members] << person.id
        
        # merge each of the 4 topping lists
        group[:toppings].members.each do |list_name|
            # want group and person topping lists as hashes with topping_ids as keys, because merge
            
        end
    end
    
end

