class RemovePhoneNumberIdFromEnduser < ActiveRecord::Migration[5.2]
  def change
    remove_column :endusers, :phone_number_id, :integer
  end
end
