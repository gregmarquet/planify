class EntriesController < ApplicationController
  def index
    @entry = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.save
    redirect_to entry_path(@entry)
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
