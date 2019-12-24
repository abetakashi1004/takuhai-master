class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.integer :shipper_id
      t.integer :product_name_id
      t.integer :postcode_id
      t.integer :time_zone_id
      t.string :phone_number
      t.integer :size_id
      t.integer :slip_number
      t.string :destination
      t.string :address
      t.date :delivery_date
      t.boolean :absence, default: false
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
