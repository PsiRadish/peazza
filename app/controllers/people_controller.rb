class PeopleController < ApplicationController
    before_action :is_authenticated?, only: [:edit, :update]
    
    def edit
        @preferences_form = PreferencesForm.new
        @preferences_form.populate_from(@current_account.person)
        
        @all_toppings = Topping.order(:category, :name);
        
        # render json: @preferences_form
    end
  
    def update
        # render json: params
        
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
                end
            end
            
            flash[:success] = "Your topping preferences have been updated."
            
            person.save
        else
            flash[:danger] = "Something went wrong and your topping preferences were not saved."
        end
        
        redirect_to edit_topping_prefs_path(@current_account.person)
    end
end
