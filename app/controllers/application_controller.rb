class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  before_action :authorized?, :initialize_tasks

  private

  def authorized?
    redirect_to login_path if !logged_in?
    
    if params[:user_id] && params[:user_id].to_i != current_user.id
      redirect_to user_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def initialize_tasks
    @task = Task.new
  end

end
