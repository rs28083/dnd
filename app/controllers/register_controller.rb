class RegisterController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
    end
    
    def create
        @username = params["username"]
        @email = params["email"]
        @pw = params["password"]
        @pw2 = params["passwordC"]
        if @pw == @pw2 then
        else
            ##redirect / reload page ##session[:current_user_id] = @user.id
        end
            
    end
end
