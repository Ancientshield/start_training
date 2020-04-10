class AddDegreeToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :degree, :integer
  end
end
