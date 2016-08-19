class StatsController < ApplicationController
  def index
    @user = current_user
    @task = Task.new
    # @dashboard = Dashboard.new 
    # @category_with_most_tasks = Category.with_most_tasks
    # @category_with_most_completed_tasks = Category.with_most_completed_tasks
    # @category_with_most_abandoned_tasks = Category.with_most_abandoned_tasks
    @total_number_of_tasks= Task.count
  end
end
