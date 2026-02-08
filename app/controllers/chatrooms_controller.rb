class ChatroomsController < ApplicationController
    before_action :require_user, only: [:index]

    def index
        @profile = curr_user
        @messages = @profile.messages
    end
end
