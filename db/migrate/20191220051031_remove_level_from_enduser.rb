class RemoveLevelFromEnduser < ActiveRecord::Migration[5.2]
  def change
    remove_column :endusers, :level, :integer
  end
end
