require 'test_helper'

class ResponseControllerTest < ActionController::TestCase
  test "should get response_display" do
    get :response_display
    assert_response :success
  end

end
