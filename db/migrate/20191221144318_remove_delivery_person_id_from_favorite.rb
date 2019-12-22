class RemoveDeliveryPersonIdFromFavorite < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :delivery_preson_id, :integer
  end
end
