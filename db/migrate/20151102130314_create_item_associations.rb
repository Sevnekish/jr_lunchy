class CreateItemAssociations < ActiveRecord::Migration
  def change
    create_table :item_associations do |t|
      t.integer :item_id
      t.integer :item_association_id
      t.string :item_association_type
      t.decimal :price

      t.timestamps null: false
    end
  end
end
