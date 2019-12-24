class CreateTodayCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :today_courses do |t|
      t.integer :delivery_person_id
      t.integer :postcode

      t.timestamps
    end
  end
end
