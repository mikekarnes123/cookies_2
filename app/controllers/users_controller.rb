class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end



  def create
    if params[:user]
      user = User.new(user_params)
      if user.db_check
        user.save
        session[:current_user_id] = user.id
        render :index
      else
        redirect_to new_user_path
      end
    else
      result = User.authenticate(params[:user_name], params[:password])
      if result == false
        redirect_to new_user_path
      else
        session[:current_user_id] = result
      end
    end
  end


  private


  def user_params
    params.require(:user).permit(:user_name, :password, :email)
  end
end
