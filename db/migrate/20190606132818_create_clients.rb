class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_name
      t.string :house_number
      t.string :post_code
      t.string :city
      t.datetime :birthday
      t.timestamps
    end
  end
end
