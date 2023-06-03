class SpendingsController < ApplicationController
    def new
      @user = current_user
      @categories = Category.where(user_ref_id: @user.id)
      @category = Category.find(params[:category_id])
    end
  
    def create
      @user = current_user
  
      begin
        spending = Spending.create(
          name: spening_params_permit['name'],
          amount: spening_params_permit['amount'],
          author_id: @user.id
        )
        spening_params_permit['category_ids'].each do |c_id|
          next if c_id.empty?
  
          category = Category.find(c_id.to_i)
          SpendItem.create(
            spending_id: spending.id,
            category_id: category.id
          )
        end
        flash[:success] = 'Spending was added successfully'
        redirect_to user_category_path(user_ref_id: @user.id, id: params[:category_id])
      rescue ActiveRecord::RecordInvalid
        flash[:success] = 'Error creating spending'
      end
    end
  
    private
  
    def spening_params_permit
      params.require(:new_spending).permit(:name, :amount, category_ids: [])
    end
  end
  