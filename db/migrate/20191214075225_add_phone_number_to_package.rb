class AddPhoneNumberToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :phone_number, :integer
  end
end
