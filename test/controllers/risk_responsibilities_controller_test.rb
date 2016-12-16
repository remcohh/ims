require 'test_helper'

class RiskResponsibilitiesControllerTest < ActionController::TestCase
  setup do
    @risk_responsibility = risk_responsibilities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:risk_responsibilities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create risk_responsibility" do
    assert_difference('RiskResponsibility.count') do
      post :create, risk_responsibility: { risk_register_id: @risk_responsibility.risk_register_id, user_id: @risk_responsibility.user_id }
    end

    assert_redirected_to risk_responsibility_path(assigns(:risk_responsibility))
  end

  test "should show risk_responsibility" do
    get :show, id: @risk_responsibility
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @risk_responsibility
    assert_response :success
  end

  test "should update risk_responsibility" do
    patch :update, id: @risk_responsibility, risk_responsibility: { risk_register_id: @risk_responsibility.risk_register_id, user_id: @risk_responsibility.user_id }
    assert_redirected_to risk_responsibility_path(assigns(:risk_responsibility))
  end

  test "should destroy risk_responsibility" do
    assert_difference('RiskResponsibility.count', -1) do
      delete :destroy, id: @risk_responsibility
    end

    assert_redirected_to risk_responsibilities_path
  end
end
