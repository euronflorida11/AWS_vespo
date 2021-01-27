require 'test_helper'

class SportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sports_index_url
    assert_response :success
  end

  test "should get create" do
    get sports_create_url
    assert_response :success
  end

  test "should get edit" do
    get sports_edit_url
    assert_response :success
  end

  test "should get update" do
    get sports_update_url
    assert_response :success
  end
end
