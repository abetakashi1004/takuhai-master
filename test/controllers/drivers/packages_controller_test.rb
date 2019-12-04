require 'test_helper'

class Drivers::PackagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get drivers_packages_show_url
    assert_response :success
  end

end
