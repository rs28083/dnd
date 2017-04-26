class WelcomeController < ApplicationController
  def index
    if session[:current_user_id] then
      @user = User.find_by id: session[:current_user_id]
      @cuser = @user.username
    else
      @cuser = ""
    end
  end
end
