require 'test_helper'

class CallsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get calls_create_url
    assert_response :success
  end

  test "should get show" do
    get calls_show_url
    assert_response :success
  end

  test "should get edit" do
    get calls_edit_url
    assert_response :success
  end

  test "should get update" do
    get calls_update_url
    assert_response :success
  end

  test "should get destroy" do
    get calls_destroy_url
    assert_response :success
  end

end
