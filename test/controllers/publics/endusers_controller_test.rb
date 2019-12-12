require 'test_helper'

class Publics::EndusersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publics_endusers_show_url
    assert_response :success
  end

  test "should get edit" do
    get publics_endusers_edit_url
    assert_response :success
  end

end
