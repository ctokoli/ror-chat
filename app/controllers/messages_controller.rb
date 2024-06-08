class MessagesController < ApplicationController
  before_action :set_chat_room

  def create
    if @chat_room.users.include?(current_user)
      @message = @chat_room.messages.create!(message_params.merge(user: current_user))
      redirect_to chat_path(@chat_room)
    else
      redirect_to root_path, alert: "You are not authorized to post messages in this chat room."
    end
  end

  private
  
  def set_chat_room
    @chat_room = ChatRoom.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
