class SpendingsController < ApplicationController
  def new
    @user = current_user
    @categories = Category.where(user_id: @user.id)
    @category = Category.find(params[:category_id])
  end

  def create
    @user = current_user

    begin
      spending = Spending.create(
        name: configure_spending_params['name'],
        amount: configure_spending_params['amount'],
        author_id: @user.id
      )
      configure_spending_params['category_ids'].each do |c_id|
        next if c_id.empty?

        category = Category.find(c_id.to_i)
        SpendItem.create(
          spending_id: spending.id,
          category_id: category.id
        )
      end
      flash[:success] = 'Spending Added'
      redirect_to user_category_path(user_id: @user.id, id: params[:category_id])
    rescue ActiveRecord::RecordInvalid
      flash[:success] = 'Error Occured while creating spending'
    end
  end

  private

  def configure_spending_params
    params.require(:new_spending).permit(:name, :amount, category_ids: [])
  end
end
