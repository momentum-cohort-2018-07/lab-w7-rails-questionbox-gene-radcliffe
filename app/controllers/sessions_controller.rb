class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:create, :destroy, :login]
  def login
    if session[:user_id]
      redirect_to welcome_index_path
    end
  end
  def create
  
    if params[:token]
      token = params[:token]
      username = params[:username]
      userid = params[:userid]
      joined = params[:joined]

      session[:username] = username
      session[:user_id] = userid
      session[:token] = token
      session[:joined] = joined.to_date
      flash[:notice] = "logged in"
    end 
    # user = User.find_by auth_token: token
  
    
  end
  def destroy

      session[:user_id]=nil
      session[:token]=nil
      session[:username]=nil
      flash[:notice] = "You have logged out"
      redirect_to welcome_index_path
  end
end
