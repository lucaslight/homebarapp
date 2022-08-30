require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get uikit" do
    get pages_uikit_url
    assert_response :success
  end
end
