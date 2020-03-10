class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(params_user)
      redirect_to user_path
    else
      render 'edit'
    end

  end

  private

  def params_user
    params.require(:user).permit(:first_name, :last_name, :photo, :bio, :email)
  end
end
