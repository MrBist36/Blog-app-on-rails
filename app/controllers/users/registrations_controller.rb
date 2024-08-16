class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super do |resource|
      @organizations = Organization.all
    end
  end

  def create
    @user = User.new(signup_params)
    @org = Organization.find(params[:organization_id])
    if @org
      User.transaction do
        if @user.save
          @membership = Membership.new(user_id: @user.id, organization_id: @org.id)
          if @membership.save
            redirect_to root_path, notice: 'Membership was successfully created.'
          else
            redirect_to new_user_registration_path, notice: 'Membership could not be created.'
          end
        else
          redirect_to new_user_registration_path, notice: 'User could not be registered.'
        end
      end
    else
      redirect_to new_user_registration_path, notice: 'Organization not found !!.'
    end
  end

  private
  def signup_params
    params.require(:user).permit(:email,:password,:password_confirmation)
  end
end