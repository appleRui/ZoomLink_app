class UserController < ApplicationController

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: 'ユーザー情報が更新されました'
    else
      @lists = current_user.lists.all.order(stu_week: :asc)
      select_lists = current_user.lists.where(stu_week: Date.today.wday).order(stu_time: :asc)
      binding.pry
      @today_lists = select_lists.select { |select_list| select_list.stu_time.to_i > @T_NOW || select_list.stu_time.to_i == 0 }
      render template: "lists/index"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
