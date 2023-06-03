require 'rails_helper'

RSpec.describe 'Users#index', type: :system do
  before :each do
    @user = User.first
  end
  it 'Placeholder Text' do
    visit users_path
    expect(page).to have_content('Spendings Tracker')
  end

  it 'Button Click Works' do
    visit users_path
    find(:button, 'Sign In').click
    sleep 1
    expect(current_path).to eql '/users/sign_in'
  end

  it 'Sign up page works' do
    visit users_path
    find(:button, 'Sign Up').click
    sleep 1
    expect(current_path).to eql '/users/sign_up'
  end
end
