require 'rails_helper'

RSpec.describe 'user creation workflow' do
  it 'should create new user' do
    bob = User.create(user_name: 'bob123', email: 'bob@email.com', password: 'qwerty')
  visit new_user_path
    fill_in 'user[user_name]', with: 'bob123'
    fill_in 'user[email]', with: 'bob@email.com'
    fill_in 'user[password]', with: 'qwerty'
    click_on 'Create User'
    expect(current_path).to eq(new_user_path)
    visit new_user_path
    fill_in 'user[user_name]', with: 'ewfa'
    fill_in 'user[email]', with: 'njfewjunad'
    fill_in 'user[password]', with: 'kmfewjw'
    click_on 'Create User'
    expect(current_path).to eq(users_path)
  end

  it 'should test login' do
    bob = User.create(user_name: 'bob123', email: 'bob@email.com', password: 'qwerty')
    visit login_path
    fill_in 'user_name', with: 'bob123'
    fill_in 'password', with: 'qwerty'
    click_button 'Submit'
    expect(current_path).to eq(users_path)
    visit login_path
    fill_in 'user_name', with: 'joeshmo'
    fill_in 'password', with: 'dvewz'
    click_button 'Submit'
    expect(current_path).to eq(new_user_path)



  end


end
