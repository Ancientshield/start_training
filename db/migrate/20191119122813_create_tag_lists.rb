class CreateTagLists < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_lists do |t|
      t.integer :task_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
