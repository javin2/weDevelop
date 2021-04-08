class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.date :projected_completion
      t.string :title
      t.text :description
      t.integer :percent_complete
      t.integer :balance
      t.belongs_to :client, null: false, foreign_key: true
      t.belongs_to :developer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
