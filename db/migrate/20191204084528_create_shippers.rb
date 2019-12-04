class CreateShippers < ActiveRecord::Migration[5.2]
  def change
    create_table :shippers do |t|
      t.string :shipper_name
      t.integer :postcode
      t.string :address
      t.integer :phone_number

      t.timestamps
    end
  end
end
