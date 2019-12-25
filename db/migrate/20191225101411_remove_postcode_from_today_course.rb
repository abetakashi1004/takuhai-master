class RemovePostcodeFromTodayCourse < ActiveRecord::Migration[5.2]
  def change
    remove_column :today_courses, :postcode, :integer
  end
end
