class User < ApplicationRecord
  validates_presence_of :user_name
  validates_presence_of :password
  validates_presence_of :email

  def db_check
    return false if User.where(user_name: user_name).count != 0
    return false if User.where(user_name: email).count != 0
    return false if user_name == nil
    return false if email == nil
    return false if password == nil
    true
  end


  def self.authenticate(user_name, password)
    if User.where(user_name: user_name, password: password)
      x = User.where(user_name: user_name)
      binding.pry
    else
      redirect_to login_path
    end
  end
end
