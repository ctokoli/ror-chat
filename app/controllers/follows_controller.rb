class FollowsController < ApplicationController
  def create
    @follow = current_user.followed_relationships.build(followed_id: params[:followed_id])
    if @follow.save
      create_chat_room(current_user, User.find(params[:followed_id]))
      redirect_to root_path, notice: "Followed successfully."
    else
      redirect_to root_path, alert: "Unable to follow."
    end
  end

  private

  def create_chat_room(user1, user2)
    chat_room = ChatRoom.create!(name: "Chat between #{user1.email} and #{user2.email}")
    Membership.create!(user: user1, chat_room: chat_room)
    Membership.create!(user: user2, chat_room: chat_room)
  end
end
