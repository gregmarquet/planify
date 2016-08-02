class StatsController < ApplicationController
  def index
    @user = current_user
    @entry = Entry.new

    @category_with_most_entries = Category.with_most_entries
    @category_with_most_completed_entries = Category.with_most_completed_entries
  end
end
