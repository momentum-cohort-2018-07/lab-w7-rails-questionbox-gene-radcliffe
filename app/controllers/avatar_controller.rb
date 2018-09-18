class AvatarController < ApplicationController
   
    def new
       binding.pry
        puts "***********uploader******!!!!"
        puts "***********uploader******!!!!"
        @uploader = User.new.avatar
        @uploader.success_action_redirect = avatar_index_path
       
    end

    def index
        
        # @uploader.update_attribute :avatar_key, params[:key]
    end

      def create
        puts "***********create******!!!!"
        # @uploader.update_attribute :avatar_key, params[:key]
      end
end
