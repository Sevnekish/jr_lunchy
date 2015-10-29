class CreateDayMenuItems < ActiveRecord::Migration
  def change
    create_table :day_menu_items do |t|
      t.integer :day_menu_id
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
