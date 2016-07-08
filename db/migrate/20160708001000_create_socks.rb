class CreateSocks < ActiveRecord::Migration
  def change
    create_table :socks do |t|
      t.string :name
      t.string :price
      t.string :image
      t.string :description
      t.string :size

      t.timestamps null: false
    end
  end
end
