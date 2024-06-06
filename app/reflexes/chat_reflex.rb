class ChatReflex < ApplicationReflex
  def post_message
    chat_room = ChatRoom.find(element.dataset[:chat_room_id])
    message = chat_room.messages.create!(
      user: current_user,
      content: element[:value]
    )
    CableReady::Channel.new("chat_channel").tap do |channel|
      channel.insert_adjacent_html(
        selector: "#messages",
        position: "beforeend",
        html: render(partial: "messages/message", locals: { message: message })
      )
      channel.broadcast
    end
  end
end
