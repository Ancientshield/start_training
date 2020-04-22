# frozen_string_literal: true

class ChangeStateAndPriorityToBeIntegerInTask < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :state, :integer, using: 'state::integer'
    change_column :tasks, :priority, :integer, using: 'priority::integer'
  end
end
