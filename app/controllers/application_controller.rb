class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    
    before_action :current_account
    
    def current_account
        @current_account ||= Account.find_by_id(session[:account_id])
    end
    
    def is_authenticated?
        unless @current_account
            flash[:danger] = 'You must be logged in to perform this action.'
            
            #session[:return_to] = request.env['PATH_INFO']
            
            redirect_to login_path
        end
    end    
end
