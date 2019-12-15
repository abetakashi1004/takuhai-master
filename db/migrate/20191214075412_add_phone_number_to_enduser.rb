class AddPhoneNumberToEnduser < ActiveRecord::Migration[5.2]
  def change
    add_column :endusers, :phone_number, :integer
  end
end
