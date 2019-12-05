class RemoveCourseIdFromTodayCourse < ActiveRecord::Migration[5.2]
  def change
    remove_column :today_courses, :course_id, :integer
  end
end
