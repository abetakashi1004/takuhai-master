require 'test_helper'

class Publics::RedeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get publics_redeliveries_new_url
    assert_response :success
  end

end
