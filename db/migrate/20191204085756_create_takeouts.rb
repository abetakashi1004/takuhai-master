class CreateTakeouts < ActiveRecord::Migration[5.2]
  def change
    create_table :takeouts do |t|
      t.integer :delivery_person_id
      t.integer :package_id
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
