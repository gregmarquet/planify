class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :description
      t.boolean :completed, default: false
      t.integer :user_category_id

      t.timestamps null: false
    end
  end
end
