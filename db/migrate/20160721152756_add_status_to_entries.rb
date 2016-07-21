class AddStatusToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :status, :string, :default => "ensure"
  end
end
