class RemovePhoneNumberFromEnduser < ActiveRecord::Migration[5.2]
  def change
    remove_column :endusers, :phone_number, :integer
  end
end
