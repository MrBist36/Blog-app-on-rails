class Users::SessionsController < Devise::SessionsController
  def new
    super do |resource|
      @organizations = Organization.all
    end
  end

  def create
    # debugger;
    @org = Organization.find_by(id: params[:organization_id].to_i)
    @user = @org.users.find_by(email: params[:user][:email])
    if @org.nil?
      redirect_to new_user_session_path, notice: 'Organization not found.'
    end
    
    if !@user
      render :new, notice: 'User not found.'
      super 
    else
      if !@user.valid_password?(params[:user][:password])
        puts params[:user][:password]
        redirect_to new_user_session_path, notice: "Wrong password !"
      else
        sign_in_and_redirect @user
      end
    end
  end
end