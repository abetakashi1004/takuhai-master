class RemovePointFromEnduser < ActiveRecord::Migration[5.2]
  def change
    remove_column :endusers, :point, :integer
  end
end
