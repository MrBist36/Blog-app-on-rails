class ProfilesController < ApplicationController
  # before_action :set_profile, only: [:show, :edit, :update]
  def new
    @organization_id = Membership.find_by(user_id: current_user.id).organization_id
    @organization = Organization.find_by(id: @organization_id)
    @profile = @organization.users.find_by(id:current_user.id).build_profile
  end

  def create
    @organization_id = Membership.find_by(user_id: current_user.id).organization_id
    @organization = Organization.find_by(id: @organization_id)
    @profile = @organization.users.find_by(id:current_user.id).build_profile(profile_params)
    if @profile.save
      redirect_to profiles_path, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def show
    @organization_id = Membership.find_by(user_id: current_user.id).organization_id
    @organization = Organization.find_by(id: @organization_id)
    @profile = @organization.users.find_by(id:current_user.id).profile
  end

  def edit
    @organization_id = Membership.find_by(user_id: current_user.id).organization_id
    @organization = Organization.find_by(id: @organization_id)
    @profile = Profile.find(params[:id])
  end
  
  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to profiles_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:full_name, :gender, :address, :date_of_birth, :user_id, :organization_id)
  end
end
