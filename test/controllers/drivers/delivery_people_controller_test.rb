require 'test_helper'

class Drivers::DeliveryPeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get drivers_delivery_people_show_url
    assert_response :success
  end

end
