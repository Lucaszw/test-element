require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  test "should get categoryList" do
    get :categoryList
    assert_response :success
  end

end
