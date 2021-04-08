class CreateDevelopers < ActiveRecord::Migration[6.1]
  def change
    create_table :developers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :company_name
      t.string :email
      t.string :profile_photo

      t.timestamps
    end
  end
end
