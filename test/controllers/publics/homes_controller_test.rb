require 'test_helper'

class Publics::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_homes_index_url
    assert_response :success
  end

  test "should get about" do
    get publics_homes_about_url
    assert_response :success
  end

  test "should get plus" do
    get publics_homes_plus_url
    assert_response :success
  end

end
