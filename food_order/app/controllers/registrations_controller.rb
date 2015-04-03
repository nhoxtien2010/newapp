class User::RegistrationsController < Devise::RegistrationsController

  def edit
    @chanpas = params[:chanpas]
    @abc = "test app"
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :gender, :email, :profile_picture, :permission, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :gender, :email, :password, :password_confirmation,:profile_picture, :current_password)
  end

  
end