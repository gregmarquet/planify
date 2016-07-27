
class AddStatusToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :status, :string, :default => "incomplete"
  end
end
