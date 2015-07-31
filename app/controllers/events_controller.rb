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
        @events = (@current_account.events + @current_account.person.events).uniq
    end
    
    def show
        @event = Event.find params[:id]
    end
    
    def new
        @event = Event.new
    end
    #Event.first.attribute_names
    #["id", "account_id", "name", "location_street_address", "location_city", "location_state", "location_zip", "date", "created_at", "updated_at"]
    def create
        new_event = Event.create( params.require(:event).permit(Event.attribute_names - ["id", "account_id", "created_at", "updated_at"]) )
        
        if (new_event.persisted?)   # add self and friends to
            new_event.account = @current_account
            new_event.people << [@current_account.person] + @current_account.friends.map do |f| f.person end
            
            make_pizzas(new_event)
            new_event.save
            
            redirect_to event_path(new_event)
        end
    end
    
    def edit
        @event = Event.find params[:id]
    end
    
    def update
        event = Event.find params[:id]
        make_pizzas(event)  # redo pizza formation
        event.save
        
        redirect_to event_path(event)
    end
    
    def destroy
        devent = Event.find(params[:id])
        devent_name = devent.name
        
        if !devent.pizzas.empty?   # clear out old pizzas
            devent.pizzas.each do |pizza| pizza.delete end
            devent.pizzas.clear
        end
        
        flash[:success] = "Event \"#{devent_name}\" deleted."
        
        devent.delete
        
        redirect_to events_path
    end
    
    private ##########################
    
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
    
    def make_pizzas event
        #rconsole.log "Making pizzas"
        
        if !event.pizzas.empty?   # clear out old pizzas
            event.pizzas.each do |pizza| pizza.delete end
            event.pizzas.clear
            #rconsole.log "Cleared out old pizzas"
        end
        
        pizza_groups = [ {members: [], toppings: GroupToppings.new} ]
        #rconsole.log "Empty pizza_groups: #{pizza_groups}"
        
        event.people.each do |person|
            #rconsole.log "Evaluating pizza for #{person.name}"
            if pizza_groups[0][:members].empty? # first iteration of loop
                add_person_to_group(person, pizza_groups[0]) # initialize group with first person
                #rconsole.log "First person, initializing shit"
                next # next person
            end
            
            was_grouped = false
            
            pizza_groups.each do |group, i|
                
                #rconsole.log "#{group[:toppings][:needed_toppings].keys}, #{person.toppings_list_to_hash(:hated_toppings).keys}"
                
                if share_keys?(group[:toppings][:needed_toppings], person.toppings_list_to_hash(:hated_toppings)) or
                   share_keys?(group[:toppings][:hated_toppings], person.toppings_list_to_hash(:needed_toppings)) # incompatible preferences
                    #rconsole.log "incompatible preferences"
                    next
                else
                    #rconsole.log "adding to group #{i}"
                    add_person_to_group(person, group)
                    was_grouped = true
                end
            end
            
            if !was_grouped     #make a new group for this person
                #rconsole.log "Making new group for #{person.name}"
                new_group = { members: [], toppings: GroupToppings.new }
                add_person_to_group(person, new_group)
                
                pizza_groups << new_group
            end
        end
        
        #rconsole.log "Final pizza_groups: #{pizza_groups}"
        
        pizzas_toppings = pizza_groups.map do |group|
            group[:toppings][:needed_toppings].merge(group[:toppings][:wanted_toppings])
        end
        
        #rconsole.log "Pizza toppings: #{pizzas_toppings}"
        
        pizzas_toppings.each do |toppings|
            pizza = event.pizzas.create name: "Fancy Pizza Name Here"
            #pizza.toppings << toppings.keys
            pizza.toppings << Topping.find(toppings.keys)
            
            pizza.save
        end
    end
    
    def add_person_to_group person, group
        group_members = group[:members]
        group_toppings = group[:toppings]
        
        # add new person_id to group members
        group_members << person.id
        
        # merge each of the 4 topping lists
        group_toppings.members.each do |curr_list_name|
            # want group and person topping lists as hashes with topping_ids as keys, because merge
            
            #rconsole.log "list #{curr_list_name}"
            
            person_hash = person.toppings_list_to_hash(curr_list_name)
            #rconsole.log "Person hash #{person_hash}"
            group_hash = group_toppings[curr_list_name]
            #rconsole.log "Group hash #{group_hash}"
            
            # and now merge the lists
            group_hash = group_hash.merge(person_hash)
            #rconsole.log "Group hash after merge #{group_hash}"
            group[:toppings][curr_list_name] = group_hash
            #rconsole.log "group[:toppings][curr_list_name] #{group[:toppings][curr_list_name]}"
        end
        
        return group  # of unknown necessity
    end
    
    def share_keys? hash1, hash2
        hash1.keys.any? {|k| hash2.key?(k)}
    end
end

