class RemovePhoneNumberFromShipper < ActiveRecord::Migration[5.2]
  def change
    remove_column :shippers, :phone_number, :integer
  end
end
