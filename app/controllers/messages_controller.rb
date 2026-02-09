class MessagesController < ApplicationController
    before_action :require_user, only: [:create]

def index
    @user_id = curr_user.id
    @messages = Message.where(profile_id: @user_id).order(created_at: :desc)
end

def create
  message = Message.new(message_params)
  if message.save
    # Broadcasting the message data to the 'chatroom_channel'
 ActionCable.server.broadcast('chatroom_channel', { message: message.body }) 
 redirect_to root_path
      end
end



private
def message_params
    params.require(:message).permit(:body).merge(profile_id: curr_user.id)
end

end
