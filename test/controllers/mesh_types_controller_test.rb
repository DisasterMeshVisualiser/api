require 'test_helper'

class MeshTypesControllerTest < ActionController::TestCase
  setup do
    @mesh_type = mesh_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mesh_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mesh_type" do
    assert_difference('MeshType.count') do
      post :create, mesh_type: { label: @mesh_type.label, name: @mesh_type.name }
    end

    assert_redirected_to mesh_type_path(assigns(:mesh_type))
  end

  test "should show mesh_type" do
    get :show, id: @mesh_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mesh_type
    assert_response :success
  end

  test "should update mesh_type" do
    patch :update, id: @mesh_type, mesh_type: { label: @mesh_type.label, name: @mesh_type.name }
    assert_redirected_to mesh_type_path(assigns(:mesh_type))
  end

  test "should destroy mesh_type" do
    assert_difference('MeshType.count', -1) do
      delete :destroy, id: @mesh_type
    end

    assert_redirected_to mesh_types_path
  end
end
