class TasksController < ApplicationController
  def index
    @user = current_user
    
    @tasks = current_user.tasks
    @task = Task.new
  end

  def show
    @user = current_user
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @user = current_user
    @task = Task.new(task_params)
    @user_category = UserCategory.find_by({user_id: params[:user_id],category_id: params[:category_id]})
    @task.user_category = @user_category
    @task.save

    respond_to do |format|
      format.html { redirect_to user_user_category_path(@user, @user_category) }
      format.js
    end

  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    # binding.pry
    @user = current_user
    @task = Task.find(params[:id])
    @user_category = @task.user_category
    @task.update_and_modify!(task_params)
    
    respond_to do |format|
      format.html { redirect_to user_user_category_path(@user, @user_category) }
      format.js
    end
  end

  def destroy
    @user = current_user
    @task = Task.find(params[:id])
    @user_category = @task.user_category
    @task.destroy

    respond_to do |format|
      format.html { redirect_to user_user_category_path(@user, @user_category) }
      format.js
    end
    
  end

  private
 
  def task_params
    params.require(:task).permit(:title, :description, :status)
  end
 
end
