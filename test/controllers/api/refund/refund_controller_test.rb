require 'test_helper'

class Api::Refund::RefundControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
