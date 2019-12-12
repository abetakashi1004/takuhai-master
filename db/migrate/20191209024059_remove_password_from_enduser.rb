class RemovePasswordFromEnduser < ActiveRecord::Migration[5.2]
  def change
    remove_column :endusers, :password, :integer
  end
end
