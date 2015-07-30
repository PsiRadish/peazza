class PeopleController < ApplicationController
  before_action :is_authenticated?, only: [:edit, :update]
  
  def edit
     #render plain: radio_button_without_bootstrap :wanted_toppings, 0
    
      @preferences_form = PreferencesForm.new
      
      #render json: @preferences_form
      # gon.preferencesForm = @preferences_form
  end

  def update
  end
  
end
