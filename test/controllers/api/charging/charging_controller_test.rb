require 'test_helper'

class Api::Charging::ChargingControllerTest < ActionController::TestCase
  test "should get charging_display" do
    get :charging_display
    assert_response :success
  end

end
