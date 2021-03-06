class AddJoinTableProductsOrders < ActiveRecord::Migration[6.1]
  def change
    create_join_table :products, :orders, table_name: :quantities do |t|
      t.index :product_id
      t.index :order_id
      t.integer :quantity
    end
  end
end
