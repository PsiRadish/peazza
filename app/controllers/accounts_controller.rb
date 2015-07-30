class AccountsController < ApplicationController
    
    def new
        @account = Account.new
        @person = Person.new
    end
    
    def create
        #render json: params
        #return
        
        @person = Person.create person_params
        @account = Account.create account_params
        
        if (@account.persisted? && @person.persisted?)
            @person.account = @account
            @person.save
            @account.save
            
            session[:account_id] = @account.id
            
            redirect_to root_path
        else
            if (@account.persisted?)
                @account.delete
            elsif (@person.persisted?)
                @person.delete
            end
            
            render :new
        end
    end
    
    def show
    end
    
    private ################
    
    def account_params
        params.require(:account).permit(:email, :password)
    end
    
    def person_params
        params.require(:person).permit(:name)
    end
    
end
