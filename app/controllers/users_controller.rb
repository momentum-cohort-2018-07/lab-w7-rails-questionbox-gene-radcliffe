class UsersController < ApplicationController
  skip_before_action :authenticate, only: :show
  def signup
  
  end

  def index
  end

  def show
      if !session[:token]
      
        flash[:notice]= "You are not logged in"
        redirect_to welcome_index_path
      end
        
  end
end
