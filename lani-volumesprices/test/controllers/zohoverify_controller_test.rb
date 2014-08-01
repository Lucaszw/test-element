require 'test_helper'

class ZohoverifyControllerTest < ActionController::TestCase
  test "should get verifyforzoho" do
    get :verifyforzoho
    assert_response :success
  end

end
