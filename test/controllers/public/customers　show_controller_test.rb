require "test_helper"

class Public::Customers　showControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_customers　show_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_customers　show_update_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get public_customers　show_unsubscribe_url
    assert_response :success
  end

  test "should get withdrawal" do
    get public_customers　show_withdrawal_url
    assert_response :success
  end
end
