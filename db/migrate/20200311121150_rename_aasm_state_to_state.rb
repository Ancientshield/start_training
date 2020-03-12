# frozen_string_literal: true

class RenameAasmStateToState < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :aasm_state, :state
  end
end
