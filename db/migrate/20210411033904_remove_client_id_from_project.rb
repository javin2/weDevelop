class RemoveClientIdFromProject < ActiveRecord::Migration[6.1]
  def change
    remove_index :projects, :client_id
    remove_column :projects, :client_id, :string
  end
end
