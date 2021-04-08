class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone
      t.string :email
      t.integer :rate
      t.string :profile_photo

      t.timestamps
    end
  end
end
