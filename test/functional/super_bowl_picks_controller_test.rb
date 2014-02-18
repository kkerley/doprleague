require 'test_helper'

class SuperBowlPicksControllerTest < ActionController::TestCase
  setup do
    @super_bowl_pick = super_bowl_picks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:super_bowl_picks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create super_bowl_pick" do
    assert_difference('SuperBowlPick.count') do
      post :create, super_bowl_pick: { combined_total: @super_bowl_pick.combined_total, nfl_team_id: @super_bowl_pick.nfl_team_id, super_bowl_id: @super_bowl_pick.super_bowl_id, team_id: @super_bowl_pick.team_id }
    end

    assert_redirected_to super_bowl_pick_path(assigns(:super_bowl_pick))
  end

  test "should show super_bowl_pick" do
    get :show, id: @super_bowl_pick
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @super_bowl_pick
    assert_response :success
  end

  test "should update super_bowl_pick" do
    put :update, id: @super_bowl_pick, super_bowl_pick: { combined_total: @super_bowl_pick.combined_total, nfl_team_id: @super_bowl_pick.nfl_team_id, super_bowl_id: @super_bowl_pick.super_bowl_id, team_id: @super_bowl_pick.team_id }
    assert_redirected_to super_bowl_pick_path(assigns(:super_bowl_pick))
  end

  test "should destroy super_bowl_pick" do
    assert_difference('SuperBowlPick.count', -1) do
      delete :destroy, id: @super_bowl_pick
    end

    assert_redirected_to super_bowl_picks_path
  end
end
