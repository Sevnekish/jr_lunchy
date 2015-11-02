class DropOrderItemsAndDayMenuItemsTables < ActiveRecord::Migration
  def change
    drop_table :order_items
    drop_table :day_menu_items
  end
end
