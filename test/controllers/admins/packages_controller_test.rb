require 'test_helper'

class Admins::PackagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_packages_new_url
    assert_response :success
  end

  test "should get index" do
    get admins_packages_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_packages_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_packages_edit_url
    assert_response :success
  end

end
