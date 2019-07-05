class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".notice"
      redirect_to @user
    else
      render :new
    end
  end

  def show
    redirect_to signup_path unless @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
