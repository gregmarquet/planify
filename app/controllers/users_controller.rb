class UsersController < ApplicationController
  # allows new user signup 
  skip_before_action :authorized?, only: [:create, :update]

  def show
    # Main user dashboard
    @user = current_user
    @entry = Entry.new
  end

  def edit
    @user = current_user
    render :partial => "/layouts/user_form", :locals => { :user => @user }
  end

  def create
    @user = User.new_with_categories(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Thank you for signing up!"
    else
      redirect_to root_path
    end
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.save
    redirect_to user_path(@user)
  end

  private

  def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
