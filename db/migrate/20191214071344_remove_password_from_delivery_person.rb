class RemovePasswordFromDeliveryPerson < ActiveRecord::Migration[5.2]
  def change
    remove_column :delivery_people, :password, :string
  end
end
