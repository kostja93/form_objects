class CreateBails < ActiveRecord::Migration[5.2]
  def change
    create_table :bails do |t|
      t.string :title
      t.float :value
      t.string :currency
      t.references :credit_request, index: true
      t.timestamps
    end
  end
end
