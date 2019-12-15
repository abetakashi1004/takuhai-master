class RemovePhoneNumberIdFromPackage < ActiveRecord::Migration[5.2]
  def change
    remove_column :packages, :phone_number_id, :integer
  end
end
