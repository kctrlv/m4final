class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "You have logged in!"
      redirect_to links_path
    else
      if @user
        flash[:error] = 'Incorrect password' unless @user.authenticate(params[:password])
      else
        flash[:error] = 'User does not exist'
      end
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
