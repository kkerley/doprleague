require 'test_helper'

class SubcontractsControllerTest < ActionController::TestCase
  setup do
    @subcontract = subcontracts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subcontracts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subcontract" do
    assert_difference('Subcontract.count') do
      post :create, subcontract: { contract_id: @subcontract.contract_id, salary_amount: @subcontract.salary_amount, user_id: @subcontract.user_id }
    end

    assert_redirected_to subcontract_path(assigns(:subcontract))
  end

  test "should show subcontract" do
    get :show, id: @subcontract
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subcontract
    assert_response :success
  end

  test "should update subcontract" do
    put :update, id: @subcontract, subcontract: { contract_id: @subcontract.contract_id, salary_amount: @subcontract.salary_amount, user_id: @subcontract.user_id }
    assert_redirected_to subcontract_path(assigns(:subcontract))
  end

  test "should destroy subcontract" do
    assert_difference('Subcontract.count', -1) do
      delete :destroy, id: @subcontract
    end

    assert_redirected_to subcontracts_path
  end
end
