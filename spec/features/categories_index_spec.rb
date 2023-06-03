require 'rails_helper'

RSpec.describe 'Categories#index', type: :system do
  before :each do
    @user = User.first
    login_as(@user, scope: :user)
  end

  it 'click to a category routes to categories#new' do
    cat_id = @user.categories.first.id
    visit user_categories_path(user_id: @user.id)
    find_link('groceries').click
    sleep 1
    expect(current_path).to eql "/users/#{@user.id}/categories/#{cat_id}"
  end

  it 'click to  add new category routes to categories#new' do
    visit user_categories_path(user_id: @user.id)
    find(:button, 'Add New Category').click
    sleep 1
    expect(current_path).to eql "/users/#{@user.id}/categories/new"
  end
end
