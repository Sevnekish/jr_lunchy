class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :category_id
      t.integer :name
      t.decimal :price
      t.boolean :is_deleted, :default => false
      t.datetime :deleted_at, :null => true

      t.timestamps null: false
    end
  end
end
