class AddDeliveryPersonIdToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :delivery_person_id, :integer
  end
end
