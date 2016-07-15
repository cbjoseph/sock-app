class ChangeDescriptionInSocks < ActiveRecord::Migration
  def change
    change_column :socks, :description, :text
  end
end
