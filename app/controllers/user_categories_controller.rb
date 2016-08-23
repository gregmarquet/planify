class UserCategoriesController < ApplicationController
  def show
    # @task = Task.new
    # binding.pry
    @user = current_user
    @user_category = UserCategory.find(params[:id])
    
  end
end
