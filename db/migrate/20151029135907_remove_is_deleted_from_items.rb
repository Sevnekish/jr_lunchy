class RemoveIsDeletedFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :is_deleted, :boolean
    remove_column :items, :deleted_at, :datetime
  end
end
