class ChangeProductIdInCategorizedProduct < ActiveRecord::Migration
  def change
    rename_column :categorized_products, :product_id, :sock_id
  end
end
