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
    redirect_to user_path(@user)

  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    # byebug
    @user = current_user
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = current_user
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to user_path(@user)
  end

  private
 
  def task_params
    params.require(:task).permit(:title, :description, :status)
  end
 
end
