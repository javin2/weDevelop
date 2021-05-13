class AddFieldsToMessage < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :developer, foreign_key: true
    add_reference :messages, :client, foreign_key: true
  end
end
