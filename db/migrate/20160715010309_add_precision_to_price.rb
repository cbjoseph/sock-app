class AddPrecisionToPrice < ActiveRecord::Migration
  def change
    change_column :socks, :price, :decimal, precision: 9, scale: 2
  end
end
