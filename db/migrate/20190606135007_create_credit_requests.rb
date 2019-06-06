class CreateCreditRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_requests do |t|
      t.references :client, index: true
      t.float :value
      t.string :currency
      t.timestamps
    end
  end
end
