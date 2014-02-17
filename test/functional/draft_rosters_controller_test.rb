require 'test_helper'

class DraftRostersControllerTest < ActionController::TestCase
  setup do
    @draft_roster = draft_rosters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:draft_rosters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create draft_roster" do
    assert_difference('DraftRoster.count') do
      post :create, draft_roster: { name: @draft_roster.name, team_id: @draft_roster.team_id }
    end

    assert_redirected_to draft_roster_path(assigns(:draft_roster))
  end

  test "should show draft_roster" do
    get :show, id: @draft_roster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @draft_roster
    assert_response :success
  end

  test "should update draft_roster" do
    put :update, id: @draft_roster, draft_roster: { name: @draft_roster.name, team_id: @draft_roster.team_id }
    assert_redirected_to draft_roster_path(assigns(:draft_roster))
  end

  test "should destroy draft_roster" do
    assert_difference('DraftRoster.count', -1) do
      delete :destroy, id: @draft_roster
    end

    assert_redirected_to draft_rosters_path
  end
end
