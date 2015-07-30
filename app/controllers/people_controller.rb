class PeopleController < ApplicationController
  before_action :is_authenticated?, only: [:edit, :update]
  
  def edit
     #render plain: radio_button_without_bootstrap :wanted_toppings, 0
    
      @pref = @current_account.person
  end

  def update
  end
  
end
