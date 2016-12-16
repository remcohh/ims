require 'test_helper'

class RiskMitigationsControllerTest < ActionController::TestCase
  setup do
    @risk_mitigation = risk_mitigations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:risk_mitigations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create risk_mitigation" do
    assert_difference('RiskMitigation.count') do
      post :create, risk_mitigation: { mitigation_step: @risk_mitigation.mitigation_step, risk_register_id: @risk_mitigation.risk_register_id }
    end

    assert_redirected_to risk_mitigation_path(assigns(:risk_mitigation))
  end

  test "should show risk_mitigation" do
    get :show, id: @risk_mitigation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @risk_mitigation
    assert_response :success
  end

  test "should update risk_mitigation" do
    patch :update, id: @risk_mitigation, risk_mitigation: { mitigation_step: @risk_mitigation.mitigation_step, risk_register_id: @risk_mitigation.risk_register_id }
    assert_redirected_to risk_mitigation_path(assigns(:risk_mitigation))
  end

  test "should destroy risk_mitigation" do
    assert_difference('RiskMitigation.count', -1) do
      delete :destroy, id: @risk_mitigation
    end

    assert_redirected_to risk_mitigations_path
  end
end
