class MessagesController < ApplicationController
    def create
        if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
    @message = Message.create(params.require(:message).permit(:content,:user_id,:room_id).merge(:user_id => current_user.id))
    redirect_to :back
     else
     redirect_to :back
        flash[:notice] = "無効なユーザー"
    end
    end
    
    
end

