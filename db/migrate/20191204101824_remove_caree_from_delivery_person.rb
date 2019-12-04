class RemoveCareeFromDeliveryPerson < ActiveRecord::Migration[5.2]
  def change
    remove_column :delivery_people, :caree, :integer
  end
end
