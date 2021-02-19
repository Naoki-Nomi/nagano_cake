class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def up
    # Not Null制約を外す場合　not nullを外したいカラム横にtrueを記載
    change_column_null :orders, :status,:integer, null: true
    change_column_null :order_items, :making_status,:integer, null: true
    change_column_null :cart_items, :item_id,:integer, null: true
    change_column_null :cart_items, :customer_id,:integer, null: true
    change_column_null :cart_items, :amount,:integer, null: true
    change_column_null :addresses, :address,:string, null: true
    change_column_null :addresses, :postal_code,:string, null: true
    change_column_null :addresses, :name,:string, null: true
    change_column_null :addresses, :customer_id,:integer, null: true
  end

  def down
    change_column_null :orders, :status,:integer, null: false
    change_column_null :orders_items, :making_status,:integer, null: false
    change_column_null :cart_items, :item_id,:integer, null: false
    change_column_null :cart_items, :customer_id,:integer, null: false
    change_column_null :cart_items, :amount,:integer, null: false
    change_column_null :addresses, :address,:string, null: false
    change_column_null :addresses, :postal_code,:string, null: false
    change_column_null :addresses, :name,:string, null: false
    change_column_null :addresses, :customer_id,:integer, null: false
  end
end