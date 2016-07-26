class RemoveSockIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :sock_id, :integer
    remove_column :orders, :quantity, :integer
  end
end
