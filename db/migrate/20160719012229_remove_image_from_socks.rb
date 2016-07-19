class RemoveImageFromSocks < ActiveRecord::Migration
  def change
    remove_column :socks, :image, :string
  end
end
