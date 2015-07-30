class FriendshipsController < ApplicationController
    before_action :is_authenticated?
    
    def index
        if @current_account
            @friends = @current_account.friends
        else
            flash[:danger] = "Well this is strange."
        end
    end
    
end
