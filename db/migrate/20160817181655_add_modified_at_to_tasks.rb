class AddModifiedAtToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :modified_at, :datetime
  end
end
