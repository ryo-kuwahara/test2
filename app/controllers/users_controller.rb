class UsersController < ApplicationController
    before_action :authenticate_user!, :only => [:index,:show,:edit,:update]
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
        if @user.id == current_user.id
           @entries = current_user.entries.limit(3)
        else
            @room = Room.new
            @entry = Entry.new
        end
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
       @user = User.find(params[:id])
       @user.update(params.require(:user).permit(:first_name,:family_name,:self_introduction))
    end
    
    
    
end
