class MessagesController < ApplicationController
  def create
    @message = Message.new(strong_params)
    @message.user = current_user
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.chatroom = @chatroom

    if @message.save
      message_html = render_to_string(partial: "message", locals: { message_in_the_partial: @message } )
      ChatroomChannel.broadcast_to(@chatroom, message_html)
      redirect_to chatroom_path(@chatroom.id)
    else
      render  'chatrooms/show'
    end
  end

  private

  def strong_params
    params.require(:message)
          .permit(:content)
  end
end
