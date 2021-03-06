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

  def onboard
    current_user.update(onboarded: true)
    respond_to do |format|
      format.html { redirect_to my_house_path }
      format.js
    end
  end

  private

  def params_user
    params.require(:user).permit(:first_name, :last_name, :image, :bio, :email)
  end
end
