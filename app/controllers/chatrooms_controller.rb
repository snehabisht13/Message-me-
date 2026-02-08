class ChatroomsController < ApplicationController
    before_action :require_user, only: [:index]

    def index
        @chatrooms = Message.all
    end
end
