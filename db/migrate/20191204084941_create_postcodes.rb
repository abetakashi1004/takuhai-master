class CreatePostcodes < ActiveRecord::Migration[5.2]
  def change
    create_table :postcodes do |t|
      t.integer :postcode
      t.string :course_name
      t.integer :sales_office_id

      t.timestamps
    end
  end
end
