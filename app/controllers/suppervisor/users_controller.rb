class Suppervisor::UsersController < ApplicationController
  before_action :logged_in_user, only: [:index,:edit,:update,:destroy]
  before_action :correct_user

  def new
    @user = User.new
  end

  def index
    @users = User.paginate page: params[:page]
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = "Profile updated"
      redirect_to [:suppervisor,@user]
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to suppervisor_users_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
  def correct_user
    @user = User.find params[:id]
    redirect_to root_url unless suppervisor_user? current_user
  end
end