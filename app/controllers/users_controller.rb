class UsersController < ApplicationController
  def new
    binding.pry
    @user = User.authenticate
  end

  def index

  end



  def create
    user = User.new(user_params)
    if user.db_check
      user.save
    else
      redirect_to new_user_path
    end
  end


  private


  def user_params
    params.require(:user).permit(:user_name, :password, :email)
  end
end
