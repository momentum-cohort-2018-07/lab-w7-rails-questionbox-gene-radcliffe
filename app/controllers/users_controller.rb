class UsersController < ApplicationController
  # skip_before_action :authenticate
  def signup
  
  end
  def new
    puts "***********user new******!!!!"
    @uploader.update_attribute :avatar_key, params[:key]
  
    puts "***********user new******!!!!"
  end
  def create
    puts "***********user create******!!!!"
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
