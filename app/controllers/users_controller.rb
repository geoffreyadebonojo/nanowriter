class UsersController < ApplicationController
  def show
    # binding.pry
    @user = User.find(session[:user_id])
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :profile
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
