class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    User.create sign_up_params
    redirect_to new_user_session_path
  end

  def update
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :surname, :nic, :city, :email, :password, :password_confirmation, :avatar)
  end
  def account_update_params
    params.require(:user).permit(:name, :surname, :nic, :city, :email, :password, :password_confirmation, :current_password, :avatar)
  end
end