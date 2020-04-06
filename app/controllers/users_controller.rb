class UsersController < ApplicationController
  
    def show
        @user = User.find(params[:id])
      end
      def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to root_path
      end

      def update
        @user = User.find(params[:id])
        if @user.admin == true
          @user.update!(admin: 'false')
        elsif @user.admin == false
          @user.update!(admin: 'true')

        end
        
        end
        
      
end
