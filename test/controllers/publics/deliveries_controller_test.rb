require 'test_helper'

class Publics::DeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_deliveries_index_url
    assert_response :success
  end

end
