class RemoveEmailFromClient < ActiveRecord::Migration[6.1]
  def change
    remove_column :clients, :email, :string
  end
end
