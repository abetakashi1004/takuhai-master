class RemovePhoneNumberFromPackage < ActiveRecord::Migration[5.2]
  def change
    remove_column :packages, :phone_number, :integer
  end
end
