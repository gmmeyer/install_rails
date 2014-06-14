class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login(@user)
      redirect_to admin_url
    else
      flash[:errors] = ["Invalid Username or Password."]
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
