class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :delivery_person_id
      t.integer :package_id
      t.integer :status

      t.timestamps
    end
  end
end
