class CreateTimeZones < ActiveRecord::Migration[5.2]
  def change
    create_table :time_zones do |t|
      t.string :time_zone

      t.timestamps
    end
  end
end
