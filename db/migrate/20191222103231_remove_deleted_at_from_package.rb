class RemoveDeletedAtFromPackage < ActiveRecord::Migration[5.2]
  def change
    remove_column :packages, :deleted_at, :string
  end
end
