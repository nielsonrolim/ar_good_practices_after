class AddOrderItemsCountToOrders < ActiveRecord::Migration[5.0]
  def up
    add_column :orders, :order_items_count, :integer, default: 0

    Order.select(:id, :order_items_count).each do |order|
      order.update_attribute :order_items_count, order.order_items.size
    end
  end

  def down
    remove_column :orders, :order_items_count
  end
end
