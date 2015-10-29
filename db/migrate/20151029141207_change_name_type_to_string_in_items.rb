class ChangeNameTypeToStringInItems < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.change :name, :string
    end
  end
end
