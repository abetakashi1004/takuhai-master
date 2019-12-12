class CreatePostcodes < ActiveRecord::Migration[5.2]
  def change
    create_table :postcodes do |t|
      t.integer :delivery_course_id
      t.integer :postcode

      t.timestamps
    end
  end
end
