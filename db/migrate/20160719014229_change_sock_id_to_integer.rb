class ChangeSockIdToInteger < ActiveRecord::Migration
  def change
    change_column :images, :sock_id, "numeric USING CAST(sock_id AS numeric)"
    change_column :images, :sock_id, :integer
  end
end
