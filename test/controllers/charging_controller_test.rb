require 'test_helper'

class ChargingControllerTest < ActionController::TestCase
  test "should get charging_display" do
    get :charging_display
    assert_response :success
  end

end
