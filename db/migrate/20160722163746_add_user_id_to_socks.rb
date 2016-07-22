class AddUserIdToSocks < ActiveRecord::Migration
  def change
    add_column :socks, :user_id, :integer
  end
end
