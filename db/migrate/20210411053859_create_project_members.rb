class CreateProjectMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :project_members do |t|
      t.integer :developer_id
      t.integer :client_id
      t.integer :project_id

      t.timestamps
    end
  end
end
