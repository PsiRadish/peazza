class PeopleController < ApplicationController
    before_action :is_authenticated?, only: [:edit, :update]
    
    def edit
        #render plain: radio_button_without_bootstrap :wanted_toppings, 0
        # rconsole.log "Ruby: Toppings edit action started."
        
        @preferences_form = PreferencesForm.new
        # rconsole.log "Ruby: Done initializing new PreferencesForm."
        @preferences_form.populate_from(@current_account.person)
        # rconsole.log "Ruby: Done populating new PreferencesForm."
        
        @all_toppings = Topping.order(:category, :name);
        
        # render json: @preferences_form
        # rconsole.log "Ruby: Toppings edit action complete."
    end
  
    def update
        # render json: params
        #prefs = params[:preferences_form]
        
        person = Person.find(params[:id])
        clean_params = params.require(:preferences_form).permit(PreferencesForm.field_names)
        
        if person && clean_params && !clean_params.empty?
            if (!person.needed_toppings.empty?)
                person.needed_toppings.clear
            end
            if (!person.wanted_toppings.empty?)
                person.wanted_toppings.clear
            end
            if (!person.mehed_toppings.empty?)
                person.mehed_toppings.clear
            end
            if (!person.hated_toppings.empty?)
                person.hated_toppings.clear
            end
            
            params[:preferences_form].each do |toppingID, list_name|
                topping_id = /topping(\d+)/.match(toppingID)[1].to_i
                topping = Topping.find(topping_id)
                
                if topping and list_name != "unlisted_toppings"
                    person.public_send(list_name) << topping
                    
                    if !flash[:success]
                        flash[:success] = "Your topping preferences have been updated."
                    end
                end
            end
            
            #flash[:success] = "Your topping preferences have been updated."
            
            person.save
        else
            flash[:danger] = "Something went wrong and your topping preferences were not saved."
        end
        
        redirect_to edit_topping_prefs_path(@current_account.person)
    end
end
