require 'test_helper'

class QuizproblemsControllerTest < ActionController::TestCase
  setup do
    @quizproblem = quizproblems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quizproblems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quizproblem" do
    assert_difference('Quizproblem.count') do
      post :create, quizproblem: { correctoption: @quizproblem.correctoption, marks: @quizproblem.marks, option: @quizproblem.option, quiz_id: @quizproblem.quiz_id, statement: @quizproblem.statement }
    end

    assert_redirected_to quizproblem_path(assigns(:quizproblem))
  end

  test "should show quizproblem" do
    get :show, id: @quizproblem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quizproblem
    assert_response :success
  end

  test "should update quizproblem" do
    patch :update, id: @quizproblem, quizproblem: { correctoption: @quizproblem.correctoption, marks: @quizproblem.marks, option: @quizproblem.option, quiz_id: @quizproblem.quiz_id, statement: @quizproblem.statement }
    assert_redirected_to quizproblem_path(assigns(:quizproblem))
  end

  test "should destroy quizproblem" do
    assert_difference('Quizproblem.count', -1) do
      delete :destroy, id: @quizproblem
    end

    assert_redirected_to quizproblems_path
  end
end
