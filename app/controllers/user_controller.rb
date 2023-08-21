class UserController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
  end

  def detail
    @user = User.find(current_user.id)
  end

  def edit_email
    @user = User.find(current_user.id)
  end

  def update_email
    if user_signed_in?
      @user = User.find(current_user.id)
      if @user.update_column(:email, user_email_params[:email])
        redirect_to root_path
      end
    end
  end

  def edit_password
    @user = User.find(current_user.id)
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_password_params)
      sign_in @user, :bypass => true
      redirect_to root_path, :notice => "Your Password has been updated!"
    else
      flash[:alert] = @user.errors.full_messages.join("<br />")
      render user_edit_password_path
    end
  end

  private
    def user_email_params
      params.require(:user).permit(:email)
    end

    def user_password_params
      params.require(:user).permit(:current_password, :password, :password_confirmation)
    end
end
