require 'test_helper'

class Publics::ChangeDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get publics_change_dates_new_url
    assert_response :success
  end

end
