require 'test_helper'

class Drivers::DeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get drivers_deliveries_new_url
    assert_response :success
  end

end
