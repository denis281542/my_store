class CreatePositions < ActiveRecord::Migration[6.0]
  def up
    create_table :positions do |t|
      t.integer :cart_id
      t.integer :item_id
      t.integer :quantity
      t.timestamps
    end
    drop_table :cards_items
  end
end
