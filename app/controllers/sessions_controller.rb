class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by email: user_params[:email]

    if @user.present? && @user.password_valid?(user_params[:password])
      session[:user_id] = @user.id
      redirect_back fallback_location: root_path, notice: 'Вы успешно вошли'
    else
      flash[:alert] = 'Указан неправильный логин/пароль'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_path, notice: 'Вы успешно вышли'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
