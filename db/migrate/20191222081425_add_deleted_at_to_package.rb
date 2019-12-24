class AddDeletedAtToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :deleted_at, :datetime
  end
end
