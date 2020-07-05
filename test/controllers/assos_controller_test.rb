require 'test_helper'

class AssosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get assos_show_url
    assert_response :success
  end

  test "should get index" do
    get assos_index_url
    assert_response :success
  end

  test "should get new" do
    get assos_new_url
    assert_response :success
  end

  test "should get create" do
    get assos_create_url
    assert_response :success
  end

  test "should get edit" do
    get assos_edit_url
    assert_response :success
  end

  test "should get update" do
    get assos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get assos_destroy_url
    assert_response :success
  end

end
