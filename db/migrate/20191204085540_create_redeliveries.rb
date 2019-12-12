class CreateRedeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :redeliveries do |t|
      t.integer :package_id
      t.integer :time_zone_id
      t.date :delivery_date
      t.boolean :check, default: false

      t.timestamps
    end
  end
end
