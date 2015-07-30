class SessionsController < ApplicationController
  #login form
    def new
        #render plain: "new session"
    end
    
    #login action (create session)
    def create
        #render json: params
        
        account = Account.authenticate(params[:account][:email], params[:account][:password])
        
        #authenticate returned valid account
        if account
            session[:account_id] = account.id
            
            flash[:loginout_msg] = 'You are signed in.'
            
            redirect_to root_path
        #bad email/pass
        else
            flash[:danger] = 'Invalid email or password.'
            
            redirect_to login_path
        end

    end
    
    #logout action (invalidate session)
    def destroy
        session[:account_id] = nil
        
        flash[:login_out_msg] = "You are signed out."
        
        #redirect_to login_path
        redirect_to root_path
    end
    
end
