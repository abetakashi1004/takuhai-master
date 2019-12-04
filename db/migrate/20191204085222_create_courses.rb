class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.integer :post_code_id
      t.integer :sales_office_id
      t.string :course_name

      t.timestamps
    end
  end
end
