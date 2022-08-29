require "test_helper"

class SavedCocktailsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get saved_cocktails_create_url
    assert_response :success
  end

  test "should get index" do
    get saved_cocktails_index_url
    assert_response :success
  end
end
