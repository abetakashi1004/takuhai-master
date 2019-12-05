class RemovePhoneNumberFromPhoneNumber < ActiveRecord::Migration[5.2]
  def change
    remove_column :phone_numbers, :phone_number, :integer
  end
end
