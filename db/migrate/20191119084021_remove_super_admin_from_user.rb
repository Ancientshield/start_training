class RemoveSuperAdminFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :super_admin, :integer
  end
end
