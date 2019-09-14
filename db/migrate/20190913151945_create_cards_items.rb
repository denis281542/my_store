class CreateCardsItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cards_items, id: false do |t|
      t.integer :cart_id
      t.integer :item_id
    end
  end
end
