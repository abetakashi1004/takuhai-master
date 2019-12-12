require 'test_helper'

class Admins::ProductNamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_product_names_new_url
    assert_response :success
  end

end
