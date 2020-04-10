class AddEndTimeToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :end_time, :timestamp
  end
end
