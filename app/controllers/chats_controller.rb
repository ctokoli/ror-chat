class ChatsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
   end

  def show
    @chat_room = ChatRoom.find(params[:id])
  end

  def create
  end
end
