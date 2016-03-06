require 'test_helper'

class MeshCodesControllerTest < ActionController::TestCase
  setup do
    @mesh_code = mesh_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mesh_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mesh_code" do
    assert_difference('MeshCode.count') do
      post :create, mesh_code: { rank: @mesh_code.rank, value: @mesh_code.value }
    end

    assert_redirected_to mesh_code_path(assigns(:mesh_code))
  end

  test "should show mesh_code" do
    get :show, id: @mesh_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mesh_code
    assert_response :success
  end

  test "should update mesh_code" do
    patch :update, id: @mesh_code, mesh_code: { rank: @mesh_code.rank, value: @mesh_code.value }
    assert_redirected_to mesh_code_path(assigns(:mesh_code))
  end

  test "should destroy mesh_code" do
    assert_difference('MeshCode.count', -1) do
      delete :destroy, id: @mesh_code
    end

    assert_redirected_to mesh_codes_path
  end
end
