class ChatroomsController < ApplicationController
    before_action :require_user, only: [:index]

    def index
        @chatrooms = Message.all
        @users = Profile.all
        @message = Message.new
    end

end
