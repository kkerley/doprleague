require 'test_helper'

class SalaryProgressionsControllerTest < ActionController::TestCase
  setup do
    @salary_progression = salary_progressions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_progressions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_progression" do
    assert_difference('SalaryProgression.count') do
      post :create, salary_progression: { auction_value: @salary_progression.auction_value, year2: @salary_progression.year2, year3: @salary_progression.year3, year4: @salary_progression.year4, year5: @salary_progression.year5 }
    end

    assert_redirected_to salary_progression_path(assigns(:salary_progression))
  end

  test "should show salary_progression" do
    get :show, id: @salary_progression
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_progression
    assert_response :success
  end

  test "should update salary_progression" do
    put :update, id: @salary_progression, salary_progression: { auction_value: @salary_progression.auction_value, year2: @salary_progression.year2, year3: @salary_progression.year3, year4: @salary_progression.year4, year5: @salary_progression.year5 }
    assert_redirected_to salary_progression_path(assigns(:salary_progression))
  end

  test "should destroy salary_progression" do
    assert_difference('SalaryProgression.count', -1) do
      delete :destroy, id: @salary_progression
    end

    assert_redirected_to salary_progressions_path
  end
end
