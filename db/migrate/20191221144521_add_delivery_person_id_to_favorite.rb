class AddDeliveryPersonIdToFavorite < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :delivery_person_id, :integer
  end
end
