class SessionsController < ApplicationController
    def new
        @profile = Profile.new
    end
    
    def create
        @profile = Profile.find_by(username: params[:username].downcase)
        if @profile && @profile.authenticate(params[:password])
            session[:profile_id] = @profile.id
            redirect_to root_path
        else
            flash.now[:alert] = "Invalid username or password"
            render :new
        end
    end

    def destroy
        @profile = curr_user
        session[:profile_id] = nil
        redirect_to login_path, notice: "Logged out successfully"
    end

end