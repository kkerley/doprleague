require 'test_helper'

class LeagueAwardsControllerTest < ActionController::TestCase
  setup do
    @league_award = league_awards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:league_awards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create league_award" do
    assert_difference('LeagueAward.count') do
      post :create, league_award: { champion: @league_award.champion }
    end

    assert_redirected_to league_award_path(assigns(:league_award))
  end

  test "should show league_award" do
    get :show, id: @league_award
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @league_award
    assert_response :success
  end

  test "should update league_award" do
    put :update, id: @league_award, league_award: { champion: @league_award.champion }
    assert_redirected_to league_award_path(assigns(:league_award))
  end

  test "should destroy league_award" do
    assert_difference('LeagueAward.count', -1) do
      delete :destroy, id: @league_award
    end

    assert_redirected_to league_awards_path
  end
end
