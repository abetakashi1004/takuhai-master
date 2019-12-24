class AddDeletedAtToDeliveryPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :delivery_people, :deleted_at, :datetime
  end
end
