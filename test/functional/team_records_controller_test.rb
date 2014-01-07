require 'test_helper'

class TeamRecordsControllerTest < ActionController::TestCase
  setup do
    @team_record = team_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_record" do
    assert_difference('TeamRecord.count') do
      post :create, team_record: { division_record: @team_record.division_record, moves: @team_record.moves, pct: @team_record.pct, pts_against: @team_record.pts_against, pts_for: @team_record.pts_for, rank: @team_record.rank, standing_id: @team_record.standing_id, streak: @team_record.streak, team_id: @team_record.team_id, wlt: @team_record.wlt }
    end

    assert_redirected_to team_record_path(assigns(:team_record))
  end

  test "should show team_record" do
    get :show, id: @team_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team_record
    assert_response :success
  end

  test "should update team_record" do
    put :update, id: @team_record, team_record: { division_record: @team_record.division_record, moves: @team_record.moves, pct: @team_record.pct, pts_against: @team_record.pts_against, pts_for: @team_record.pts_for, rank: @team_record.rank, standing_id: @team_record.standing_id, streak: @team_record.streak, team_id: @team_record.team_id, wlt: @team_record.wlt }
    assert_redirected_to team_record_path(assigns(:team_record))
  end

  test "should destroy team_record" do
    assert_difference('TeamRecord.count', -1) do
      delete :destroy, id: @team_record
    end

    assert_redirected_to team_records_path
  end
end
