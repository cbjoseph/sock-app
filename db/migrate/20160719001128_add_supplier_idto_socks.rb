class AddSupplierIdtoSocks < ActiveRecord::Migration
  def change
    add_column :socks, :supplier_id, :integer
  end
end
