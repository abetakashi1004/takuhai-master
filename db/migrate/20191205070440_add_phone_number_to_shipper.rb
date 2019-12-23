class AddPhoneNumberToShipper < ActiveRecord::Migration[5.2]
  def change
    add_column :shippers, :phone_number, :string
  end
end
