class UserController < ApplicationController

  def update
    @user = current_user
    respond_to do |format|
    if @user.update(user_params)
      format.html { redirect_to lists_path, notice: 'ユーザー情報が更新されました' }
      format.json { render :index, status: :ok, location: @user }
    else
      format.html { render :users/index }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
