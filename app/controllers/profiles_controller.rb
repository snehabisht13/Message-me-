class ProfilesController < ApplicationController
    
    def new
      @profile = Profile.new
    end

    def create
      @profile = Profile.new(profile_params)
      if @profile.save
        session[:profile_id] = @profile.id
        flash[:success] = "Welcome to MessageMe, #{@profile.username}!"
        redirect_to root_path
      else
        render :new
      end
    end


    def index
    end
    


  def show
    # Placeholder for profile display logic
  end

  def edit
    # Placeholder for profile edit logic
  end

  def update
    # Placeholder for profile update logic
  end

  private 
  def profile_params
    params.require(:profile).permit(:username, :password)
  end
end