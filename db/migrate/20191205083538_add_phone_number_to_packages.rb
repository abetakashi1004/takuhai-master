class AddPhoneNumberToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :phone_number, :string
  end
end
