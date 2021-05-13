class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
