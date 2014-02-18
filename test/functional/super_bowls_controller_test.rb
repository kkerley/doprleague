require 'test_helper'

class SuperBowlsControllerTest < ActionController::TestCase
  setup do
    @super_bowl = super_bowls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:super_bowls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create super_bowl" do
    assert_difference('SuperBowl.count') do
      post :create, super_bowl: { dopr_winner_id: @super_bowl.dopr_winner_id, nfl_team1_final_score: @super_bowl.nfl_team1_final_score, nfl_team1_id: @super_bowl.nfl_team1_id, nfl_team2_final_score: @super_bowl.nfl_team2_final_score, nfl_team2_id: @super_bowl.nfl_team2_id, nfl_winner_id: @super_bowl.nfl_winner_id, tie_breaker: @super_bowl.tie_breaker }
    end

    assert_redirected_to super_bowl_path(assigns(:super_bowl))
  end

  test "should show super_bowl" do
    get :show, id: @super_bowl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @super_bowl
    assert_response :success
  end

  test "should update super_bowl" do
    put :update, id: @super_bowl, super_bowl: { dopr_winner_id: @super_bowl.dopr_winner_id, nfl_team1_final_score: @super_bowl.nfl_team1_final_score, nfl_team1_id: @super_bowl.nfl_team1_id, nfl_team2_final_score: @super_bowl.nfl_team2_final_score, nfl_team2_id: @super_bowl.nfl_team2_id, nfl_winner_id: @super_bowl.nfl_winner_id, tie_breaker: @super_bowl.tie_breaker }
    assert_redirected_to super_bowl_path(assigns(:super_bowl))
  end

  test "should destroy super_bowl" do
    assert_difference('SuperBowl.count', -1) do
      delete :destroy, id: @super_bowl
    end

    assert_redirected_to super_bowls_path
  end
end
