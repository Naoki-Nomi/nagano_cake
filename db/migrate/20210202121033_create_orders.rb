class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :delivery_postal_code, null: false
      t.string :delivery_address, null: false
      t.string :delivery_name, null: false
      t.integer :postage, null: false
      t.integer :charge, null: false
      t.integer :payment_method, null: false, defalut: 0
      t.integer :status

      t.timestamps
    end
  end
end
