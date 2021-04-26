class AddDeveloperIdToNotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :developer, null: false, foreign_key: true
  end
end
