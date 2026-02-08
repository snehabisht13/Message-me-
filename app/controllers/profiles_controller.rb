class ProfilesController < ApplicationController
    
    def new
      @profile = Profile.new
    end

    def create
      @profile = Profile.new(profile_params)
      if @profile.save
        session[:profile_id] = @profile.id
        redirect_to root_path, notice: 'Profile was successfully created.'
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