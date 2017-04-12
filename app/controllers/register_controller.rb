class RegisterController < ApplicationController
    require 'bundler/setup'
    skip_before_action :verify_authenticity_token
    def index
    end
    ## Admin user: admin 
    ## Admin  pass: dnd_admin
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
            @user = User.create(username: @username, email: @email,password_hash: @hex, password_salt: @hsh.salt)
            @user.save
            session[:current_user_id] = @user.id
            render 'show'
            ##hsh.#bin_string
            ## /char_create/79/edit
        else
            ##redirect / reload page ##session[:current_user_id] = @user.id
        end
            
    end
    def login
        session[:current_user_id] = 1
    end
end
