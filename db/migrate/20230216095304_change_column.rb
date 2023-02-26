class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :last_name, :string
    add_column :customers, :first_name, :string
    add_column :customers, :last_name_kana, :string
    add_column :customers, :first_name_kana, :string
    add_column :customers, :telephone_number, :string
    add_column :customers, :postal_code, :string
    add_column :customers, :address, :string
    add_column :customers, :is_deleted, :boolean
    change_column_null :addresses, :postal_code, false
    change_column_null :addresses, :address, false
    change_column_null :addresses, :name, false
    change_column_null :cart_items, :amount, false
    change_column_null :customers, :is_deleted, false
    change_column_null :genres, :name, false
    change_column_null :items, :name, false
    change_column_null :items, :introduction, false
    change_column_null :items, :price, false
    change_column_null :items, :sales_status, false
    change_column_null :order_details, :price, false
    change_column_null :order_details, :amount, false
    change_column_null :order_details, :making_status, false
    change_column_null :orders, :postal_code, false
    change_column_null :orders, :address, false
    change_column_null :orders, :name, false
    change_column_null :orders, :shipping_cost, false
    change_column_null :orders, :status, false
    change_column_null :orders, :total_payment, false
    change_column_null :orders, :payment_method, false
    change_column_default :customers, :is_deleted, from: nil, to: false
    change_column_default :items, :sales_status, from: nil, to: true
    change_column_default :orders, :status, from: nil, to: "0"
    change_column_default :orders, :payment_method, from: nil, to: "0"
    change_column_default :order_details, :making_status, from: nil, to: "0"
  end
end
