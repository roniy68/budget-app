require 'rails_helper'

RSpec.describe 'Categories#New', type: :system do
  before :each do
    @user = User.first
    login_as(@user, scope: :user)
  end

  it 'Confirmation of placeholder text content' do
    visit new_user_category_path(user_id: @user.id)
    expect(page).to have_content('Add a Category')
  end

  it 'Back Button Works' do
    visit new_user_category_path(user_id: @user.id)
    find_link('nav-back-link').click
    sleep 1
    expect(current_path).to eql "/users/#{@user.id}/categories"
  end

  it 'submission from new categories' do
    visit new_user_category_path(user_id: @user.id)
    fill_in 'new_category_name', with: 'test category'
    find('button#icon-popup').click
    choose(option: 'store')
    find(:button, 'Select').click
    sleep 1
    find('input[name="commit"]').click
    sleep 1
    expect(current_path).to eql "/users/#{@user.id}/categories"
  end

  it 'Cancel Button Works' do
    visit new_user_category_path(user_id: @user.id)
    find_link('Cancel').click
    sleep 1
    expect(current_path).to eql "/users/#{@user.id}/categories"
  end
end
