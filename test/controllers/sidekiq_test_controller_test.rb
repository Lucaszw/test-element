require 'test_helper'

class SidekiqTestControllerTest < ActionController::TestCase
  test "should get test_page" do
    get :test_page
    assert_response :success
  end

end
