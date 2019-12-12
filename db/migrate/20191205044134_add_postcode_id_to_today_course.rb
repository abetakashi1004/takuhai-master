class AddPostcodeIdToTodayCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :today_courses, :postcode_id, :integer
  end
end
