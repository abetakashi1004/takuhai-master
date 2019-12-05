require 'test_helper'

class Drivers::TodayCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get drivers_today_courses_new_url
    assert_response :success
  end

end
