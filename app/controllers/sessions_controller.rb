class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      
      redirect_to cookies[:initial_page] || root_path
      cookies.delete :initial_page
    else
      flash[:alert] = "Введен некорректный электронный адрес или пароль"

      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path
  end
end
