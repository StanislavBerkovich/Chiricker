class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    #TODO: отловить ошибки регистрации
    User.create sign_up_params
    redirect_to new_user_session_path
  end

  def update
    super
  end

  private

  def sign_up_params
    downcase_params params.require(:user).permit(:name, :surname, :nic, :city, :email, :password, :password_confirmation, :avatar)
  end

  def downcase_params(p)
    p.each do |key, v|
      if v.respond_to? :downcase
        p[key] = v.downcase
      end
    end
    p
  end

  def account_update_params
    downcase_params  params.require(:user).permit(:name, :surname, :nic, :city, :email, :password, :password_confirmation, :current_password, :avatar)
  end
end