class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:username, :avatar, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :avatar, :email, :password, :password_confirmation, :current_password)
  end

  def after_update_path_for(resource)
    families_path
  end
end
