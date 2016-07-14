class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :value
      t.integer :user_category_id

      t.timestamps null: false
    end
  end
end
