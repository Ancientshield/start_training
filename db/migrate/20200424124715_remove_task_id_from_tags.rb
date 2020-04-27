# frozen_string_literal: true

class RemoveTaskIdFromTags < ActiveRecord::Migration[6.0]
  def change
    remove_column :tags, :task_id
  end
end
