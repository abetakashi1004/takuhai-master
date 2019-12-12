class AddPhoneNumberToPhoneNumber < ActiveRecord::Migration[5.2]
  def change
    add_column :phone_numbers, :phone_number, :string
  end
end
