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
           @hsh = PBKDF2.new do |p| 
                p.password = @pw
                p.salt = SecureRandom.base64(255)
                p.iterations = 2
            end
            @hex = @hsh.hex_string
            @character = User.create(username: @username, email: @email,password_hash: @hex, password_salt: @hsh.salt)
            render 'show'
            ##hsh.#bin_string
        else
            ##redirect / reload page ##session[:current_user_id] = @user.id
        end
            
    end
end
