class Users::SessionsController < Devise::SessionsController
  def new
    super do |resource|
      @organizations = Organization.all
    end
  end

  def create
    @org = Organization.find_by(id: params[:organization_id].to_i)

    if @org.nil?
      redirect_to new_user_session_path, notice: 'Organization not found.' and return
    end

    @user = @org.users.find_by(email: params[:user][:email])

    if @user.nil?
      flash[:alert] = 'User not found.'
      @organizations = Organization.all
      render :new and return
    end

    if !@user.valid_password?(params[:user][:password])
      flash[:alert] = "Wrong password!"
      @organizations = Organization.all
      render :new and return
    end

    sign_in_and_redirect @user
  end
end
