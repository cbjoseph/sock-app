class ChangeSocksIdinOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :socks_id, :sock_id
  end
end
