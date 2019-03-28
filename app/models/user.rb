class User < ApplicationRecord
  validates_presence_of :user_name
  validates_presence_of :password
  validates_presence_of :email

  def db_check
    return false if User.find_by(user_name: user_name) != nil
    return false if User.find_by(user_name: email) != nil 
    return false if user_name == nil
    return false if email == nil
    return false if password == nil
    true
  end


  def self.authenticate(user_name, password)
    if User.find_by(user_name: user_name, password: password)
      User.find_by(user_name: user_name).id
    else
      false
    end
  end
end
