require "test_helper"

class CabinetsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cabinets_create_url
    assert_response :success
  end

  test "should get update" do
    get cabinets_update_url
    assert_response :success
  end
end
