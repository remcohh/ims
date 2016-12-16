require 'test_helper'

class RiskRegistersControllerTest < ActionController::TestCase
  setup do
    @risk_register = risk_registers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:risk_registers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create risk_register" do
    assert_difference('RiskRegister.count') do
      post :create, risk_register: { category_id: @risk_register.category_id, description: @risk_register.description, impact: @risk_register.impact, probability: @risk_register.probability, project_id: @risk_register.project_id, risk_no: @risk_register.risk_no, status: @risk_register.status, target_date: @risk_register.target_date, user_id: @risk_register.user_id }
    end

    assert_redirected_to risk_register_path(assigns(:risk_register))
  end

  test "should show risk_register" do
    get :show, id: @risk_register
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @risk_register
    assert_response :success
  end

  test "should update risk_register" do
    patch :update, id: @risk_register, risk_register: { category_id: @risk_register.category_id, description: @risk_register.description, impact: @risk_register.impact, probability: @risk_register.probability, project_id: @risk_register.project_id, risk_no: @risk_register.risk_no, status: @risk_register.status, target_date: @risk_register.target_date, user_id: @risk_register.user_id }
    assert_redirected_to risk_register_path(assigns(:risk_register))
  end

  test "should destroy risk_register" do
    assert_difference('RiskRegister.count', -1) do
      delete :destroy, id: @risk_register
    end

    assert_redirected_to risk_registers_path
  end
end
