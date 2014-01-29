require 'test_helper'

class TasktopsControllerTest < ActionController::TestCase
  setup do
    @tasktop = tasktops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasktops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tasktop" do
    assert_difference('Tasktop.count') do
      post :create, tasktop: { name: @tasktop.name, owner: @tasktop.owner, weight: @tasktop.weight }
    end

    assert_redirected_to tasktop_path(assigns(:tasktop))
  end

  test "should show tasktop" do
    get :show, id: @tasktop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tasktop
    assert_response :success
  end

  test "should update tasktop" do
    patch :update, id: @tasktop, tasktop: { name: @tasktop.name, owner: @tasktop.owner, weight: @tasktop.weight }
    assert_redirected_to tasktop_path(assigns(:tasktop))
  end

  test "should destroy tasktop" do
    assert_difference('Tasktop.count', -1) do
      delete :destroy, id: @tasktop
    end

    assert_redirected_to tasktops_path
  end
end
