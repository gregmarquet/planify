class RemoveCompletedFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :completed, :boolean
  end
end
