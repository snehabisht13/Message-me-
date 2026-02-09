class SessionsController < ApplicationController
    before_action :logged_in_already, only: [:new, :create]
    def new
        @profile = Profile.new
    end
    
    def create
        @profile = Profile.find_by(username: params[:username].downcase)
        if @profile && @profile.authenticate(params[:password])
            session[:profile_id] = @profile.id
            flash[:success] = "Welcome back, #{@profile.username}!"
            redirect_to root_path
        else
            flash.now[:alert] = "Invalid username or password"
            render :new
        end
    end

    def destroy
        @profile = curr_user
        session[:profile_id] = nil
        flash[:notice] = "Logged out successfully"
        redirect_to login_path
    end

    private
    def logged_in_already
        if curr_user
            flash[:alert] = "You are already logged in"
            redirect_to root_path
        end
    end

end