class EntriesController < ApplicationController
  def index
    @entry = Entry.all
  end

  def show
    @user = current_user
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def create
    @user = current_user
    @entry = Entry.new(entry_params)
    @user_category = UserCategory.find_by({user_id: params[:user_id],category_id: params[:category_id]})
    @entry.user_category = @user_category
    @entry.save
    redirect_to user_path(@user)

  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update(entry_params)
    redirect_to entry_path(@entry)
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  private
 
  def entry_params
    params.require(:entry).permit(:title, :description)
  end
 
end
