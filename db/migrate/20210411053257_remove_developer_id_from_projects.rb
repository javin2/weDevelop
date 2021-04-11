class RemoveDeveloperIdFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :developer_id, :string
  end
end
