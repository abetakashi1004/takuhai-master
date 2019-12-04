require 'test_helper'

class Admins::ShippersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_shippers_new_url
    assert_response :success
  end

end
