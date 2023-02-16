require "test_helper"

class Admin::MakingsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_makings_update_url
    assert_response :success
  end
end
