require 'test_helper'

class Drivers::TakeoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get drivers_takeouts_new_url
    assert_response :success
  end

  test "should get index" do
    get drivers_takeouts_index_url
    assert_response :success
  end

  test "should get complete" do
    get drivers_takeouts_complete_url
    assert_response :success
  end

end
