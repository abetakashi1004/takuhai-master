class RemovePasswordFromDeliveryPeople < ActiveRecord::Migration[5.2]
  def change
    remove_column :delivery_people, :password, :integer
  end
end
