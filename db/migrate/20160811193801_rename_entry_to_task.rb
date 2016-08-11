class RenameEntryToTask < ActiveRecord::Migration
  def change
    rename_table :entries, :tasks
  end
end
