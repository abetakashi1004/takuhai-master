class RemoveDeliveryCourseIdFromPostcode < ActiveRecord::Migration[5.2]
  def change
    remove_column :postcodes, :delivery_course_id, :integer
  end
end
