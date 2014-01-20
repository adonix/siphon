class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :videos, [:user_id, :created_at]
  end
end
