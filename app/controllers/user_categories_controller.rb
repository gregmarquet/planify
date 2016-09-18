class UserCategoriesController < ApplicationController
  def show
    @user = current_user
    @user_category = UserCategory.find(params[:id])
    
  end
end
