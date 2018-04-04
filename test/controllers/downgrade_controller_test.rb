require 'test_helper'

class DowngradeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get downgrade_index_url
    assert_response :success
  end

  test "should get show" do
    get downgrade_show_url
    assert_response :success
  end

  test "should get new" do
    get downgrade_new_url
    assert_response :success
  end

  test "should get edit" do
    get downgrade_edit_url
    assert_response :success
  end

end
