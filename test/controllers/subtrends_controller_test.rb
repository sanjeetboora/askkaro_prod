require 'test_helper'

class SubtrendsControllerTest < ActionController::TestCase
  setup do
    @subtrend = subtrends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subtrends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subtrend" do
    assert_difference('Subtrend.count') do
      post :create, subtrend: { maintrend_id: @subtrend.maintrend_id, subtitle: @subtrend.subtitle }
    end

    assert_redirected_to subtrend_path(assigns(:subtrend))
  end

  test "should show subtrend" do
    get :show, id: @subtrend
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subtrend
    assert_response :success
  end

  test "should update subtrend" do
    patch :update, id: @subtrend, subtrend: { maintrend_id: @subtrend.maintrend_id, subtitle: @subtrend.subtitle }
    assert_redirected_to subtrend_path(assigns(:subtrend))
  end

  test "should destroy subtrend" do
    assert_difference('Subtrend.count', -1) do
      delete :destroy, id: @subtrend
    end

    assert_redirected_to subtrends_path
  end
end
